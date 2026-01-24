#!/bin/bash
set -e

echo "╔════════════════════════════════════════════════════════╗"
echo "║         THOX IMAGINE INSTALLER                         ║"
echo "║              © 2026 Thox.ai LLC                        ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""

# Check Ollama
if ! command -v ollama &> /dev/null; then
    echo "❌ Ollama not found"
    echo "Please install from: https://ollama.ai"
    exit 1
fi

echo "✅ Ollama found"

# Pull base model
echo "📥 Checking base model x/flux2-klein..."
if ! ollama list | grep -q "x/flux2-klein"; then
    echo "Pulling x/flux2-klein (this may take a while)..."
    ollama pull x/flux2-klein
fi

echo "✅ Base model ready"

# Create Thox Imagine
echo "🎨 Creating Thox Imagine model..."
ollama create Thox-ai/thox-imagine -f Modelfile

echo ""
echo "╔════════════════════════════════════════════════════════╗"
echo "║         INSTALLATION COMPLETE!                         ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""
echo "🚀 Quick Start:"
echo "   ollama run Thox-ai/thox-imagine 'A beautiful sunset'"
echo ""
echo "📚 Documentation:"
echo "   README.md - Full documentation"
echo "   QUICKSTART.md - Quick start guide"
echo ""
echo "🛠️  Tools:"
echo "   ./thox-imagine-cli.sh - CLI interface"
echo "   ./thox_imagine_api.py - Python API"
echo "   ./thox-imagine-demo.sh - Interactive demo"
echo ""
echo "© 2026 Thox.ai LLC. All Rights Reserved."
