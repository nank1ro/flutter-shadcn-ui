#!/bin/bash

# Ensure the script fails on errors
set -e

# Ensure cli directory exists
mkdir -p cli

# Initialize JSON output
output="{}"

# Find all .dart files in lib directory
while IFS= read -r file; do
  # Get relative path from lib directory
  relative_path="${file#lib/}"
  
  # Calculate SHA-1 hash using git hash-object
  sha=$(git hash-object "$file")
  
  # Add to JSON using jq
  output=$(echo "$output" | jq --arg path "$relative_path" --arg sha "$sha" '. + {($path): $sha}')
done < <(find lib -type f -name "*.dart")

# Write JSON to cli/hashes.json
echo "$output" > cli/hashes.json
