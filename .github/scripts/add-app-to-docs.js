#!/usr/bin/env node

'use strict';

// ----------------------------------------------------------------------------
// SECURITY (GHSA-r2gv-jrj7-hp4v)
//
// This script processes ATTACKER-CONTROLLED issue content (ISSUE_BODY) while the
// workflow holds a write-capable GITHUB_TOKEN. Two hard rules keep it safe:
//
//   1. Never build shell command strings. Only ever invoke external programs
//      with `execFileSync(cmd, [argv...])` (shell:false, the default), so no
//      value can ever be interpreted by a shell.
//   2. Never interpolate values into code/markup. App entries are stored as
//      DATA in docs/apps.json via JSON.stringify, never as generated JS.
//
// Inputs are also validated up front (see validateSiteName / validateSiteUrl).
// Validation uses no regular expressions (ReDoS-avoidance): the URL is checked
// with the WHATWG URL parser and the name with explicit code-point rules.
// ----------------------------------------------------------------------------

const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const { execFileSync } = require('node:child_process');

const APPS_JSON_PATH = 'docs/apps.json';
const MAX_NAME_LENGTH = 80;

// Punctuation permitted inside a site name. The ASCII range is where every shell
// and JS metacharacter lives, so within it we use a strict allowlist (letters and
// digits are handled separately). Chosen to accept real names such as
// "Rhex: HEX & RGB Editor", "buildr.studio", "Human Design - Joy", "iOS/macOS".
const ALLOWED_ASCII_PUNCTUATION = new Set([
  ' ', '&', '.', ',', ':', "'", '-', '_', '/', '(', ')', '+',
]);

/**
 * Code points that must never appear in a site name: C0/C1 controls, DEL, and
 * Unicode format / separator / bidi / zero-width characters. Blocking these
 * stops control-character tricks, newline-based $GITHUB_OUTPUT injection, and
 * bidi/zero-width display spoofing.
 */
function isForbiddenCodePoint(cp) {
  if (cp < 0x20 || cp === 0x7f) return true; // C0 controls + DEL
  if (cp >= 0x80 && cp <= 0x9f) return true; // C1 controls
  if (cp >= 0x200b && cp <= 0x200f) return true; // zero-width + bidi marks
  if (cp === 0x2028 || cp === 0x2029) return true; // line / paragraph separators
  if (cp >= 0x202a && cp <= 0x202e) return true; // bidi embeddings / overrides
  if (cp >= 0x2060 && cp <= 0x2064) return true; // word joiner / invisible ops
  if (cp >= 0x2066 && cp <= 0x2069) return true; // bidi isolates
  if (cp === 0xfeff) return true; // BOM / zero-width no-break space
  return false;
}

function isAsciiLetterOrDigit(cp) {
  return (
    (cp >= 0x30 && cp <= 0x39) || // 0-9
    (cp >= 0x41 && cp <= 0x5a) || // A-Z
    (cp >= 0x61 && cp <= 0x7a) // a-z
  );
}

/**
 * Validate the site name. Returns the trimmed name or throws.
 * Within ASCII: strict allowlist (letters, digits, ALLOWED_ASCII_PUNCTUATION).
 * Outside ASCII: permitted (accents, CJK, ...) unless explicitly forbidden.
 */
function validateSiteName(rawName) {
  if (typeof rawName !== 'string') {
    throw new Error('Missing required field: Site Name');
  }
  const name = rawName.trim();
  if (name.length === 0) {
    throw new Error('Site Name is empty');
  }
  // Count by code point, not UTF-16 code unit.
  if (Array.from(name).length > MAX_NAME_LENGTH) {
    throw new Error(`Site Name exceeds ${MAX_NAME_LENGTH} characters`);
  }
  for (const ch of name) {
    const cp = ch.codePointAt(0);
    if (isForbiddenCodePoint(cp)) {
      const hex = cp.toString(16).toUpperCase().padStart(4, '0');
      throw new Error(`Site Name contains a forbidden character (U+${hex})`);
    }
    if (cp <= 0x7e && !isAsciiLetterOrDigit(cp) && !ALLOWED_ASCII_PUNCTUATION.has(ch)) {
      throw new Error(`Site Name contains a disallowed character: "${ch}"`);
    }
  }
  return name;
}

/**
 * Detect a leading RFC-3986 "scheme:" (ALPHA *(ALPHA / DIGIT / "+" / "-" / "."))
 * without a regex. Used only to decide whether to prepend "https://". A colon
 * that appears inside a path or query (e.g. "site.com/r?to=https://x") is NOT a
 * leading scheme, so such scheme-less input still gets the prefix. A digit right
 * after the colon means "host:port" (e.g. "site.com:8080"), also not a scheme.
 */
function hasUrlScheme(value) {
  const colon = value.indexOf(':');
  if (colon <= 0) return false;
  const afterColon = value.charCodeAt(colon + 1);
  if (afterColon >= 0x30 && afterColon <= 0x39) return false; // host:port, not a scheme
  for (let i = 0; i < colon; i++) {
    const cp = value.charCodeAt(i);
    const isAlpha = (cp >= 0x41 && cp <= 0x5a) || (cp >= 0x61 && cp <= 0x7a);
    const isDigit = cp >= 0x30 && cp <= 0x39;
    const isSchemeSpecial = cp === 0x2b || cp === 0x2d || cp === 0x2e; // + - .
    if (i === 0 ? !isAlpha : !(isAlpha || isDigit || isSchemeSpecial)) {
      return false;
    }
  }
  return true;
}

/**
 * Validate the site URL with the WHATWG URL parser (not a regex). Returns the
 * normalized URL string or throws. Only http/https, no credentials, must have a
 * host. This closes javascript:/data:/file: stored-XSS hrefs and credential URLs.
 */
function validateSiteUrl(rawUrl) {
  if (typeof rawUrl !== 'string') {
    throw new Error('Missing required field: Site URL');
  }
  const candidate = rawUrl.trim();
  if (candidate.length === 0) {
    throw new Error('Site URL is empty');
  }

  // Only add a scheme when the input is genuinely scheme-less. If a scheme is
  // already present, parse it as-is so non-http(s) schemes are caught by the
  // protocol check below rather than masked. (Keying on a leading scheme rather
  // than a bare "://" avoids false-rejecting URLs like "site.com/r?to=https://x".)
  const toParse = hasUrlScheme(candidate) ? candidate : `https://${candidate}`;

  let url;
  try {
    url = new URL(toParse);
  } catch {
    throw new Error(`Invalid URL: ${rawUrl}`);
  }

  if (url.protocol !== 'http:' && url.protocol !== 'https:') {
    throw new Error('Site URL must use the http or https scheme');
  }
  if (url.username !== '' || url.password !== '') {
    throw new Error('Site URL must not contain credentials');
  }
  if (url.hostname === '') {
    throw new Error('Site URL must contain a host');
  }
  return url.toString();
}

/**
 * Extract "Site URL" and "Site Name" from the issue body without regular
 * expressions. A GitHub issue form renders each field as:
 *   ### <Label>
 *
 *   <value>
 */
function parseIssueBody(issueBody) {
  const text = typeof issueBody === 'string' ? issueBody : '';
  const lines = text
    .split('\n')
    .map((line) => (line.endsWith('\r') ? line.slice(0, -1) : line));

  const findFieldValue = (label) => {
    const heading = `### ${label}`.toLowerCase();
    for (let i = 0; i < lines.length; i++) {
      if (lines[i].trim().toLowerCase() === heading) {
        for (let j = i + 1; j < lines.length; j++) {
          const value = lines[j].trim();
          if (value.length > 0) return value;
        }
        return null;
      }
    }
    return null;
  };

  return {
    siteUrl: findFieldValue('Site URL'),
    siteName: findFieldValue('Site Name'),
  };
}

/**
 * Build a git-branch-safe slug from a name without using a regex
 * (every char that is not [a-z0-9] becomes "-", matching the previous behavior).
 */
function toBranchSlug(name) {
  let slug = '';
  for (const ch of name.toLowerCase()) {
    const cp = ch.codePointAt(0);
    const isLowerAlnum =
      (cp >= 0x30 && cp <= 0x39) || (cp >= 0x61 && cp <= 0x7a);
    slug += isLowerAlnum ? ch : '-';
  }
  return slug;
}

/**
 * Append a new app entry to docs/apps.json. Returns the updated items array or
 * throws. JSON.stringify guarantees the (validated) values are stored as inert
 * data, so structural characters cannot break out of the file.
 */
function addAppToAppsJson(siteName, siteUrl, appsJsonPath = APPS_JSON_PATH) {
  const raw = fs.readFileSync(appsJsonPath, 'utf8');
  let items;
  try {
    items = JSON.parse(raw);
  } catch (error) {
    throw new Error(`Failed to parse ${appsJsonPath}: ${error.message}`);
  }
  if (!Array.isArray(items)) {
    throw new Error(`${appsJsonPath} must contain a JSON array`);
  }
  if (items.some((item) => item && item.label === siteName)) {
    throw new Error(`App "${siteName}" already exists in the documentation`);
  }

  items.push({
    label: siteName,
    link: siteUrl,
    attrs: { target: '_blank', rel: 'noopener noreferrer' },
  });

  fs.writeFileSync(appsJsonPath, `${JSON.stringify(items, null, 2)}\n`, 'utf8');
  console.log(`✅ Added ${siteName} to ${appsJsonPath}`);
  return items;
}

/**
 * Expose a workflow step output (no-op when run locally without $GITHUB_OUTPUT).
 */
function setOutput(name, value) {
  const outputFile = process.env.GITHUB_OUTPUT;
  if (!outputFile) return;
  fs.appendFileSync(outputFile, `${name}=${value}\n`, 'utf8');
}

/**
 * Create branch, commit, push, and open a PR — all via execFileSync argv arrays.
 */
function createPullRequest(siteName, issueNumber) {
  const branchName = `add-app-${toBranchSlug(siteName)}-${issueNumber}`;
  const commitMessage =
    `docs: add ${siteName} to apps showcase\n\n` +
    `Automatically added from issue #${issueNumber}`;

  const run = (cmd, args) => execFileSync(cmd, args, { stdio: 'inherit' });

  run('git', ['config', 'user.name', 'github-actions[bot]']);
  run('git', ['config', 'user.email', 'github-actions[bot]@users.noreply.github.com']);
  run('git', ['checkout', '-b', branchName]);
  run('git', ['add', APPS_JSON_PATH]);
  run('git', ['commit', '-m', commitMessage]);
  run('git', ['push', 'origin', branchName]);

  const prTitle = `docs: add ${siteName} to apps showcase`;
  const prBody =
    `Automatically adds ${siteName} to the apps showcase in the documentation.\n\n` +
    `This PR was created automatically from issue #${issueNumber}.\n\n` +
    `**Changes:**\n` +
    `- Added ${siteName} to the "Apps created with Flutter Shadcn UI" section in \`${APPS_JSON_PATH}\`\n\n` +
    `Closes #${issueNumber}`;

  const tempBodyFile = path.join(os.tmpdir(), `pr-body-${process.pid}.md`);
  fs.writeFileSync(tempBodyFile, prBody, 'utf8');
  try {
    const prResult = execFileSync(
      'gh',
      [
        'pr', 'create',
        '--title', prTitle,
        '--body-file', tempBodyFile,
        '--head', branchName,
        '--base', 'main',
      ],
      { encoding: 'utf8' },
    );
    const prUrl = prResult.trim();
    console.log(`✅ Created PR: ${prUrl}`);
    return prUrl;
  } finally {
    if (fs.existsSync(tempBodyFile)) fs.unlinkSync(tempBodyFile);
  }
}

function main() {
  const issueBody = process.env.ISSUE_BODY;
  const issueNumber = process.env.ISSUE_NUMBER;

  if (!issueBody || !issueNumber) {
    throw new Error('Missing required environment variables: ISSUE_BODY, ISSUE_NUMBER');
  }
  // issueNumber comes from github.event.issue.number (an integer); enforce that
  // it is digits-only since it flows into the branch name and commit message.
  if (![...String(issueNumber)].every((c) => c >= '0' && c <= '9')) {
    throw new Error(`Invalid issue number: ${issueNumber}`);
  }

  console.log('🔍 Parsing issue body...');
  const parsed = parseIssueBody(issueBody);

  console.log('✅ Validating input...');
  const siteName = validateSiteName(parsed.siteName);
  const siteUrl = validateSiteUrl(parsed.siteUrl);

  console.log(`📝 Adding ${siteName} (${siteUrl}) to documentation...`);
  addAppToAppsJson(siteName, siteUrl);

  console.log('🚀 Creating pull request...');
  const prUrl = createPullRequest(siteName, issueNumber);
  setOutput('pr_url', prUrl);

  console.log(`🎉 Successfully automated app submission for ${siteName}!`);
}

if (require.main === module) {
  try {
    main();
  } catch (error) {
    console.error('❌ Error:', error.message);
    process.exit(1);
  }
}

module.exports = {
  parseIssueBody,
  validateSiteName,
  validateSiteUrl,
  addAppToAppsJson,
  toBranchSlug,
};
