#!/bin/bash

# Template Generation Script
# This script generates new content for the target repository
# Called from GitHub Actions workflow with target directory as argument

set -euo pipefail  # Exit on error, undefined vars, and pipe failures

TARGET_DIR="${1:-}"

if [ -z "$TARGET_DIR" ]; then
    echo "Error: Target directory not provided"
    echo "Usage: $0 <target_directory>"
    exit 1
fi

if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Target directory '$TARGET_DIR' does not exist"
    exit 1
fi

echo "🚀 Starting template generation..."
echo "Target directory: $TARGET_DIR"

# Navigate to target directory
cd "$TARGET_DIR"

# Example content generation - customize this section
echo "📝 Generating template files..."

# Create a basic README
cat > README.md << 'EOF'
# Generated Template Repository

This repository is automatically generated and maintained by a GitHub Actions workflow.

## Last Updated
EOF

echo "$(date -u '+%Y-%m-%d %H:%M:%S UTC')" >> README.md

# Create a basic package.json (customize as needed)
cat > package.json << 'EOF'
{
  "name": "generated-template",
  "version": "1.0.0",
  "description": "Automatically generated template repository",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [
    "template",
    "generated"
  ],
  "author": "Template Generator Bot",
  "license": "MIT"
}
EOF

# Create a basic .gitignore
cat > .gitignore << 'EOF'
node_modules/
*.log
.DS_Store
.env
dist/
build/
EOF

# Create a basic index.js
cat > index.js << 'EOF'
// Generated template file
console.log('Hello from generated template!');

// Add your template logic here
function generateTemplate() {
    return {
        message: 'This is a generated template',
        timestamp: new Date().toISOString(),
        version: '1.0.0'
    };
}

module.exports = { generateTemplate };
EOF

# Add any additional files or directory structure here
mkdir -p src
cat > src/template.js << 'EOF'
// Template source file
export const templateConfig = {
    name: 'Generated Template',
    version: '1.0.0',
    features: [
        'Automated generation',
        'Version control',
        'Customizable content'
    ]
};
EOF

echo "✅ Template generation completed successfully!"
echo "Generated files:"
find . -type f -not -path './.git/*' | sort