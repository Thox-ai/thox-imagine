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

echo "✅ FLUX2-Klein model ready"

# Make tools executable
echo "🔧 Setting up tools..."
chmod +x thox-imagine-cli.sh 2>/dev/null || true
chmod +x thox_imagine_api.py 2>/dev/null || true
chmod +x thox-imagine-demo.sh 2>/dev/null || true
chmod +x thox-imagine-generate 2>/dev/null || true

echo "✅ Tools configured"
echo ""
echo "╔════════════════════════════════════════════════════════╗"
echo "║         INSTALLATION COMPLETE!                         ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""
echo "🚀 Quick Start:"
echo "   ollama run x/flux2-klein 'A beautiful sunset'"
echo "   ./thox-imagine-generate 'A beautiful sunset'"
echo ""
echo "📚 Documentation:"
echo "   README.md - Full documentation"
echo "   QUICKSTART.md - Quick start guide"
echo ""
echo "🛠️  Tools Available:"
echo "   ./thox-imagine-generate - Branded generation wrapper"
echo "   ./thox-imagine-cli.sh - Interactive CLI"
echo "   ./thox_imagine_api.py - Python API"
echo "   ./thox-imagine-demo.sh - Interactive demo"
echo ""
echo "💡 Tip: Use thox-imagine-generate for automatic watermarking!"
echo ""
echo "© 2026 Thox.ai LLC. All Rights Reserved."
