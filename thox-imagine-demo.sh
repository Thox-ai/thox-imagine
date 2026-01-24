#!/bin/bash

# Thox Imagine Demo Script
# Demonstrates various capabilities of the model
# © 2026 Thox.ai LLC

echo "╔════════════════════════════════════════════════════════╗"
echo "║         THOX IMAGINE - AI IMAGE GENERATION            ║"
echo "║              © 2026 Thox.ai LLC                        ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""

# Check if model exists
echo "🔍 Checking model installation..."
if ollama list | grep -q "Thox-ai/thox-imagine"; then
    echo "✅ Thox Imagine model is installed"
else
    echo "❌ Thox Imagine model not found!"
    echo "Please create the model first:"
    echo "  ollama create Thox-ai/thox-imagine -f Modelfile.thox-imagine"
    exit 1
fi

echo ""
echo "📊 Model Information:"
ollama list | grep "Thox-ai/thox-imagine"

echo ""
echo "════════════════════════════════════════════════════════"
echo "                    DEMO MENU                           "
echo "════════════════════════════════════════════════════════"
echo ""
echo "1. Quick test - Simple prompt"
echo "2. Photorealistic generation"
echo "3. Artistic style"
echo "4. Abstract art"
echo "5. Concept art"
echo "6. Custom prompt"
echo "7. Batch generation demo"
echo "8. Show model details"
echo "9. View example prompts"
echo "0. Exit"
echo ""

read -p "Select an option (0-9): " choice

case $choice in
    1)
        echo ""
        echo "🎨 Quick Test - Generating simple landscape..."
        ./thox-imagine-cli.sh "A peaceful mountain landscape at sunset with colorful sky"
        ;;
    2)
        echo ""
        echo "📷 Photorealistic Generation..."
        ./thox-imagine-cli.sh "Ultra-realistic portrait of an elderly wise man with white beard, soft natural lighting, professional photography, 8k quality, shallow depth of field"
        ;;
    3)
        echo ""
        echo "🎭 Artistic Style Generation..."
        ./thox-imagine-cli.sh "Impressionist painting of a Parisian cafe, loose brushstrokes, vibrant colors, Claude Monet style, afternoon light"
        ;;
    4)
        echo ""
        echo "🌀 Abstract Art Generation..."
        ./thox-imagine-cli.sh "Dynamic abstract composition with flowing geometric shapes, gradient colors from deep blue to golden yellow, modern minimalist design"
        ;;
    5)
        echo ""
        echo "🚀 Concept Art Generation..."
        ./thox-imagine-cli.sh "Futuristic sci-fi spaceship interior, holographic displays, sleek metallic surfaces, cyberpunk aesthetic, dramatic lighting"
        ;;
    6)
        echo ""
        read -p "Enter your custom prompt: " custom_prompt
        if [ -n "$custom_prompt" ]; then
            ./thox-imagine-cli.sh "$custom_prompt"
        else
            echo "❌ Prompt cannot be empty"
        fi
        ;;
    7)
        echo ""
        echo "📦 Batch Generation Demo..."
        echo "Generating 3 themed images..."

        cat > /tmp/thox_batch_prompts.txt << EOF
A serene zen garden with raked sand patterns and stone arrangements
A vibrant coral reef teeming with tropical fish
A cozy library with floor-to-ceiling bookshelves and warm lighting
EOF

        python3 thox_imagine_api.py --batch /tmp/thox_batch_prompts.txt
        ;;
    8)
        echo ""
        echo "ℹ️  Model Details:"
        echo "════════════════════════════════════════════════════════"
        python3 thox_imagine_api.py --info
        ;;
    9)
        echo ""
        ./thox-imagine-cli.sh --examples
        ;;
    0)
        echo ""
        echo "👋 Thanks for trying Thox Imagine!"
        echo "© 2026 Thox.ai LLC"
        exit 0
        ;;
    *)
        echo ""
        echo "❌ Invalid option"
        exit 1
        ;;
esac

echo ""
echo "════════════════════════════════════════════════════════"
echo "✅ Demo complete!"
echo ""
echo "💡 Tips:"
echo "  • All images include automatic watermark"
echo "  • Images saved to: thox-imagine-outputs/"
echo "  • Use --help for more options"
echo ""
echo "📚 For full documentation, see: THOX_IMAGINE_README.md"
echo ""
echo "© 2026 Thox.ai LLC. All Rights Reserved."
