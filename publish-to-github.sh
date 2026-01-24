#!/bin/bash

echo "╔════════════════════════════════════════════════════════╗"
echo "║         THOX IMAGINE - GITHUB PUBLISHER                ║"
echo "║              © 2026 Thox.ai LLC                        ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""

# Check if we're in the right directory
if [ ! -f "Modelfile" ]; then
    echo "❌ Error: Please run this from the thox-imagine-official directory"
    exit 1
fi

echo "🔍 Current status:"
git status --short
echo ""

# Ask for GitHub username/org
echo "📝 Before we begin, you need to create a GitHub repository:"
echo ""
echo "1. Go to: https://github.com/new"
echo "2. Repository name: thox-imagine"
echo "3. Description: AI Image Generation Model with Automatic Watermarking"
echo "4. Make it PUBLIC ✅"
echo "5. Do NOT initialize with README, .gitignore, or license"
echo "6. Click 'Create repository'"
echo ""

read -p "Have you created the repository? (y/n): " created

if [[ ! $created =~ ^[Yy]$ ]]; then
    echo ""
    echo "Please create the repository first, then run this script again."
    exit 0
fi

echo ""
read -p "Enter your GitHub username or organization name: " github_user

if [ -z "$github_user" ]; then
    echo "❌ Error: GitHub username cannot be empty"
    exit 1
fi

echo ""
echo "🚀 Publishing to: https://github.com/$github_user/thox-imagine"
echo ""

# Check if remote already exists
if git remote get-url origin &>/dev/null; then
    echo "⚠️  Remote 'origin' already exists. Removing it..."
    git remote remove origin
fi

# Add remote
echo "📡 Adding GitHub remote..."
git remote add origin "https://github.com/$github_user/thox-imagine.git"

# Push to GitHub
echo "📤 Pushing to GitHub..."
if git push -u origin main; then
    echo ""
    echo "╔════════════════════════════════════════════════════════╗"
    echo "║         🎉 SUCCESSFULLY PUBLISHED! 🎉                  ║"
    echo "╚════════════════════════════════════════════════════════╝"
    echo ""
    echo "✅ Your model is now live at:"
    echo "   https://github.com/$github_user/thox-imagine"
    echo ""
    echo "📋 Next Steps:"
    echo ""
    echo "1. Create a release (v1.0.0):"
    echo "   https://github.com/$github_user/thox-imagine/releases/new"
    echo ""
    echo "2. Tag: v1.0.0"
    echo "3. Title: Thox Imagine v1.0.0 - Initial Release"
    echo "4. Copy description from PUBLISHING_INSTRUCTIONS.md"
    echo ""
    echo "5. Share your model:"
    echo "   • Reddit: r/ollama, r/LocalLLaMA"
    echo "   • Twitter/X: #ollama #imagegeneration"
    echo "   • Hacker News"
    echo ""
    echo "Users can now install with:"
    echo "   git clone https://github.com/$github_user/thox-imagine.git"
    echo "   cd thox-imagine"
    echo "   ./install.sh"
    echo ""
    echo "© 2026 Thox.ai LLC. All Rights Reserved."
else
    echo ""
    echo "❌ Push failed!"
    echo ""
    echo "Common issues:"
    echo "1. Repository doesn't exist on GitHub - create it first"
    echo "2. Authentication failed - you may need to:"
    echo "   • Set up SSH keys: https://docs.github.com/en/authentication"
    echo "   • Or use GitHub CLI: gh auth login"
    echo ""
    echo "Try again after resolving the issue."
    exit 1
fi
