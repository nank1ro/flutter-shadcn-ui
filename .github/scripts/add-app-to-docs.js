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

  // Create the new app entry object
  const newApp = {
    label: siteName,
    link: siteUrl,
    attrs: { target: '_blank', rel: 'noopener noreferrer' }
  };

  // Find the apps section
  const appsStartRegex = /label: 'Apps created with Flutter Shadcn UI',[\s\S]*?items: \[/;
  const appsStartMatch = configContent.match(appsStartRegex);

  if (!appsStartMatch) {
    throw new Error('Could not find the apps section start in astro.config.mjs');
  }

  const appsStartIndex = appsStartMatch.index + appsStartMatch[0].length;

  // Find the end of the items array for the apps section
  let braceCount = 1;
  let currentIndex = appsStartIndex;
  let appsEndIndex = -1;

  while (currentIndex < configContent.length && braceCount > 0) {
    const char = configContent[currentIndex];
    if (char === '[') braceCount++;
    if (char === ']') braceCount--;
    if (braceCount === 0) {
      appsEndIndex = currentIndex;
      break;
    }
    currentIndex++;
  }

  if (appsEndIndex === -1) {
    throw new Error('Could not find the apps section end in astro.config.mjs');
  }

  // Extract the items array content
  const itemsContent = configContent.substring(appsStartIndex, appsEndIndex).trim();

  // Parse existing items by evaluating as JavaScript
  let existingItems = [];
  try {
    // Safely extract the items array by wrapping it in brackets and evaluating
    const itemsArray = eval(`[${itemsContent}]`);
    existingItems = itemsArray;
  } catch (error) {
    throw new Error(`Failed to parse existing items: ${error.message}`);
  }

  // Check if the app already exists
  const existingAppIndex = existingItems.findIndex(item => item.label === siteName);
  if (existingAppIndex !== -1) {
    throw new Error(`App "${siteName}" already exists in the documentation`);
  }

  // Simply append the new app to the existing items (preserving order)
  const finalItems = [...existingItems, newApp];

  // Format the items as proper JavaScript objects
  const formattedItems = finalItems.map(item => {
    const lines = ['            {'];
    lines.push(`              label: '${item.label}',`);
    lines.push(`              link: '${item.link}',`);
    if (item.badge) {
      lines.push(`              badge: { text: '${item.badge.text}' },`);
    }
    if (item.attrs) {
      const attrsStr = Object.entries(item.attrs)
        .map(([key, value]) => `${key}: '${value}'`)
        .join(', ');
      lines.push(`              attrs: { ${attrsStr} },`);
    }
    lines.push('            }');
    return lines.join('\n');
  }).join(',\n');

  // Reconstruct the full config
  const beforeItems = configContent.substring(0, appsStartIndex);
  const afterItems = configContent.substring(appsEndIndex);

  const newConfigContent = `${beforeItems}\n${formattedItems}\n          ${afterItems}`;

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
