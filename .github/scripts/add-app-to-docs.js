#!/usr/bin/env node

const fs = require('node:fs');
const { execSync } = require('node:child_process');

/**
 * Parse issue body to extract Site URL and Site Name
 */
function parseIssueBody(issueBody) {
  // Extract Site URL
  const urlMatch = issueBody.match(/### Site URL\s*\n\s*(.+)/i);
  const siteUrl = urlMatch ? urlMatch[1].trim() : null;

  // Extract Site Name
  const nameMatch = issueBody.match(/### Site Name\s*\n\s*(.+)/i);
  const siteName = nameMatch ? nameMatch[1].trim() : null;

  return { siteUrl, siteName };
}

/**
 * Validate the extracted data
 */
function validateData(siteUrl, siteName) {
  if (!siteUrl || !siteName) {
    throw new Error('Missing required fields: Site URL and Site Name');
  }

  // Basic URL validation
  try {
    new URL(siteUrl);
  } catch {
    throw new Error(`Invalid URL format: ${siteUrl}`);
  }

  return true;
}

/**
 * Add app entry to astro config in alphabetical order
 */
function addAppToConfig(siteUrl, siteName) {
  const configPath = 'docs/astro.config.mjs';
  const configContent = fs.readFileSync(configPath, 'utf8');

  // Create the new app entry
  const newAppEntry = `            {
              label: '${siteName}',
              link: '${siteUrl}',
              attrs: { target: '_blank', rel: 'noopener noreferrer' },
            },`;

  // Find the apps section and extract existing entries
  const appsRegex = /(label: 'Apps created with Flutter Shadcn UI',[\s\S]*?items: \[[\s\S]*?)(            \{\s*label: 'Submit your app'[\s\S]*?\},\s*)([\s\S]*?)(          \],[\s\S]*?\})/;
  const match = configContent.match(appsRegex);

  if (!match) {
    throw new Error('Could not find the apps section in astro.config.mjs');
  }

  const [, beforeSubmit, submitEntry, appsSection, afterApps] = match;

  // Extract existing app entries (excluding Submit your app)
  const appEntryRegex = /\{\s*label: '([^']+)',\s*link: '[^']+',[\s\S]*?\},/g;
  const existingApps = [];
  let appMatch;

  while ((appMatch = appEntryRegex.exec(appsSection)) !== null) {
    const fullEntry = appMatch[0];
    const label = appMatch[1];
    existingApps.push({ label, fullEntry });
  }

  // Add the new app and sort alphabetically
  existingApps.push({ label: siteName, fullEntry: newAppEntry });
  existingApps.sort((a, b) => a.label.localeCompare(b.label));

  // Reconstruct the apps section
  const sortedAppsSection = existingApps.map(app => app.fullEntry).join('\n');

  // Rebuild the config content
  const newConfigContent = configContent.replace(appsRegex,
    `$1${submitEntry}${sortedAppsSection}\n$4`
  );

  fs.writeFileSync(configPath, newConfigContent, 'utf8');
  console.log(`✅ Added ${siteName} to astro.config.mjs`);
}

/**
 * Create branch, commit changes, and create PR
 */
function createPullRequest(siteName, issueNumber) {
  const branchName = `add-app-${siteName.toLowerCase().replace(/[^a-z0-9]/g, '-')}-${issueNumber}`;
  const commitMessage = `docs: add ${siteName} to apps showcase

Automatically added from issue #${issueNumber}`;

  try {
    // Configure git
    execSync('git config user.name "github-actions[bot]"');
    execSync('git config user.email "github-actions[bot]@users.noreply.github.com"');

    // Create and switch to new branch
    execSync(`git checkout -b ${branchName}`);

    // Add and commit changes
    execSync('git add docs/astro.config.mjs');
    execSync(`git commit -m "${commitMessage}"`);

    // Push branch
    execSync(`git push origin ${branchName}`);

    // Create PR using GitHub CLI
    const prTitle = `docs: add ${siteName} to apps showcase`;
    const prBody = `Automatically adds ${siteName} to the apps showcase in the documentation.

This PR was created automatically from issue #${issueNumber}.

**Changes:**
- Added ${siteName} to the "Apps created with Flutter Shadcn UI" section in \`docs/astro.config.mjs\`
- Entry is alphabetically sorted with other apps

Closes #${issueNumber}`;

    const tempBodyFile = `pr-body-${Date.now()}.md`;
    fs.writeFileSync(tempBodyFile, prBody, 'utf8');

    try {
      const prResult = execSync(
        `gh pr create --title "${prTitle}" --body-file "${tempBodyFile}" --head "${branchName}" --base main`,
        { encoding: 'utf8' }
      );
      const prUrl = prResult.trim();
      console.log(`✅ Created PR: ${prUrl}`);
      fs.unlinkSync(tempBodyFile); // Clean up
      // Set output...
      return prUrl;
    } finally {
      if (fs.existsSync(tempBodyFile)) fs.unlinkSync(tempBodyFile);
    }
  } catch (error) {
    console.error('Error creating PR:', error.message);
    throw error;
  }
}

/**
 * Main function
 */
async function main() {
  try {
    const issueBody = process.env.ISSUE_BODY;
    const issueNumber = process.env.ISSUE_NUMBER;

    if (!issueBody || !issueNumber) {
      throw new Error('Missing required environment variables: ISSUE_BODY, ISSUE_NUMBER');
    }

    console.log('🔍 Parsing issue body...');
    const { siteUrl, siteName } = parseIssueBody(issueBody);

    console.log('✅ Validating data...');
    validateData(siteUrl, siteName);

    console.log(`📝 Adding ${siteName} (${siteUrl}) to documentation...`);
    addAppToConfig(siteUrl, siteName);

    console.log('🚀 Creating pull request...');
    const prUrl = createPullRequest(siteName, issueNumber);

    console.log(`🎉 Successfully automated app submission for ${siteName}!`);
    console.log(`PR URL: ${prUrl}`);

  } catch (error) {
    console.error('❌ Error:', error.message);
    process.exit(1);
  }
}

// Run the script
main();
