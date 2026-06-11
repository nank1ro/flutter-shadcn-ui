'use strict';

// Tests for the auto-add-app automation (GHSA-r2gv-jrj7-hp4v hardening).
// Run with: node --test .github/scripts

const test = require('node:test');
const assert = require('node:assert');
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');

const {
  parseIssueBody,
  validateSiteName,
  validateSiteUrl,
  addAppToAppsJson,
  toBranchSlug,
} = require('./add-app-to-docs.js');

test('validateSiteName accepts legitimate names (incl. existing ones)', () => {
  const accepted = [
    'Notes Calculator',
    'Rhex: HEX & RGB Editor',
    'buildr.studio',
    'Human Design - Joy',
    'iOS/macOS App',
    'Café Münster',
    'ZikZak AI',
  ];
  for (const name of accepted) {
    assert.strictEqual(validateSiteName(name), name, `should accept: ${name}`);
  }
  // Trims surrounding whitespace.
  assert.strictEqual(validateSiteName('  Padded  '), 'Padded');
});

test('validateSiteName rejects injection / control / spoofing payloads', () => {
  const rejected = [
    'x"; touch /tmp/pwned; #', // double quote + shell metachars
    '$(id)', // command substitution
    '`id`', // backtick substitution
    "a'||curl evil||'", // pipe
    'legit\nsite_name=evil', // newline -> $GITHUB_OUTPUT injection
    '<img onerror=x>', // angle brackets / =
    '‮evil', // RTL override
    'a​b', // zero-width space
    'name=value', // '=' is not allowed
    'x'.repeat(81), // over length
    '', // empty
    '   ', // whitespace only
  ];
  for (const name of rejected) {
    // 2nd arg is an Error matcher (not a message), so a wrong-type/no throw fails.
    assert.throws(() => validateSiteName(name), Error, `should reject: ${JSON.stringify(name)}`);
  }
});

test('validateSiteName boundary: exactly 80 code points is allowed', () => {
  const name = 'a'.repeat(80);
  assert.strictEqual(validateSiteName(name), name);
  assert.throws(() => validateSiteName('a'.repeat(81)), Error);
});

test('validateSiteUrl accepts http/https and prepends https when no scheme', () => {
  assert.ok(validateSiteUrl('https://x.com').startsWith('https://'));
  assert.ok(validateSiteUrl('http://x.com').startsWith('http://'));
  assert.ok(validateSiteUrl('notescalculator.com').startsWith('https://'));
  // Ports are preserved (not mistaken for a scheme).
  assert.ok(validateSiteUrl('example.com:8080').startsWith('https://example.com:8080'));
  // A scheme-less URL containing "://" inside its path/query is still accepted.
  assert.ok(
    validateSiteUrl('myapp.com/auth?redirect_uri=https://x.com').startsWith('https://myapp.com/'),
  );
});

test('validateSiteUrl rejects dangerous schemes, credentials, and empty host', () => {
  const rejected = [
    'javascript:alert(1)',
    'data:text/html,x',
    'file:///etc/passwd',
    'ftp://x',
    'mailto:a@b.com',
    'https://user:pass@evil.com',
    'https://',
    '',
    '   ',
  ];
  for (const url of rejected) {
    assert.throws(() => validateSiteUrl(url), Error, `should reject: ${JSON.stringify(url)}`);
  }
});

test('parseIssueBody extracts fields without regex (LF and CRLF)', () => {
  const lf = '### Site URL\n\nhttps://example.com\n\n### Site Name\n\nExample App\n';
  assert.deepStrictEqual(parseIssueBody(lf), {
    siteUrl: 'https://example.com',
    siteName: 'Example App',
  });

  const crlf = '### Site URL\r\n\r\nhttps://example.com\r\n\r\n### Site Name\r\n\r\nExample App\r\n';
  const parsed = parseIssueBody(crlf);
  assert.strictEqual(parsed.siteUrl, 'https://example.com');
  assert.strictEqual(parsed.siteName, 'Example App');

  // Missing fields -> null (caught by validation downstream).
  assert.deepStrictEqual(parseIssueBody('nothing here'), {
    siteUrl: null,
    siteName: null,
  });
});

test('addAppToAppsJson stores structural characters as inert data (round-trip)', () => {
  const tmp = path.join(os.tmpdir(), `apps-test-${process.pid}-${process.hrtime.bigint()}.json`);
  // Mirror the real apps.json shape: the special first entry (no attrs) and an
  // entry carrying a badge, so the test catches dropped/reordered fields.
  const seed = [
    { label: 'Submit your app', link: 'submit-your-app' },
    {
      label: 'Notes Calculator',
      link: 'https://notescalculator.com',
      badge: { text: 'Author' },
      attrs: { target: '_blank', rel: 'noopener noreferrer' },
    },
  ];
  fs.writeFileSync(tmp, JSON.stringify(seed, null, 2));
  try {
    // This value would never pass validateSiteName; this asserts the WRITER
    // itself cannot be broken out of, regardless of input.
    const nasty = `Weird"\\</script>'},{"label":"x`;
    const items = addAppToAppsJson(nasty, 'https://nasty.example', tmp);

    assert.strictEqual(items.length, 3);
    const reparsed = JSON.parse(fs.readFileSync(tmp, 'utf8'));
    assert.strictEqual(reparsed.length, 3, 'no extra entries injected');
    // Existing entries are preserved verbatim (special first entry + badge field).
    assert.deepStrictEqual(reparsed[0], { label: 'Submit your app', link: 'submit-your-app' });
    assert.deepStrictEqual(reparsed[1].badge, { text: 'Author' });
    // New entry is appended last and stored literally (no structural breakout).
    assert.strictEqual(reparsed[2].label, nasty, 'value stored literally');
    assert.strictEqual(reparsed[2].link, 'https://nasty.example');
    assert.deepStrictEqual(reparsed[2].attrs, { target: '_blank', rel: 'noopener noreferrer' });

    // Duplicate labels are rejected.
    assert.throws(() => addAppToAppsJson(nasty, 'https://nasty.example', tmp), Error);
  } finally {
    fs.rmSync(tmp, { force: true });
  }
});

test('toBranchSlug produces a safe slug', () => {
  assert.strictEqual(toBranchSlug('Rhex: HEX & RGB Editor'), 'rhex--hex---rgb-editor');
  assert.strictEqual(toBranchSlug('buildr.studio'), 'buildr-studio');
});
