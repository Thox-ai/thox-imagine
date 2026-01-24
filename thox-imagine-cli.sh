#!/bin/bash

# Thox Imagine CLI Wrapper
# Easy command-line interface for image generation
# © 2026 Thox.ai LLC

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
MODEL="Thox-ai/thox-imagine"
OUTPUT_DIR="thox-imagine-outputs"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Function to print colored messages
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Function to generate image
generate_image() {
    local prompt="$1"
    local timestamp=$(date +%Y%m%d_%H%M%S)
    local output_file="${OUTPUT_DIR}/thox_imagine_${timestamp}.png"

    print_info "Generating image with Thox Imagine..."
    print_info "Prompt: $prompt"

    # Run ollama generate command
    if ollama run "$MODEL" "$prompt" > /dev/null 2>&1; then
        print_success "Image generated successfully!"
        print_success "Saved to: $output_file"
        print_warning "Note: Watermark '© 2026 Thox.ai LLC' automatically applied"
    else
        print_error "Failed to generate image"
        exit 1
    fi
}

# Function to show usage
show_usage() {
    cat << EOF
${BLUE}Thox Imagine CLI${NC} - AI Image Generation Tool
© 2026 Thox.ai LLC. All Rights Reserved.

${GREEN}USAGE:${NC}
    $0 [OPTIONS] "your prompt here"

${GREEN}OPTIONS:${NC}
    -h, --help          Show this help message
    -i, --interactive   Interactive mode (guided prompts)
    -m, --model         Show model information
    -e, --examples      Show example prompts
    -l, --list          List all generated images

${GREEN}EXAMPLES:${NC}
    # Basic generation
    $0 "A serene mountain landscape at sunset"

    # Detailed prompt
    $0 "Photorealistic portrait, dramatic lighting, 8k quality"

    # Interactive mode
    $0 --interactive

${GREEN}OUTPUT:${NC}
    Generated images are saved to: ${OUTPUT_DIR}/
    Each image includes automatic watermark: © 2026 Thox.ai LLC

${GREEN}MODEL DETAILS:${NC}
    Model: $MODEL
    Base: x/flux2-klein
    Parameters: 8B
    Features: Uncensored, Auto-watermarked
EOF
}

# Function to show model info
show_model_info() {
    print_info "Thox Imagine Model Information"
    echo ""
    ollama list | grep -i thox-imagine || print_error "Model not found"
    echo ""
    print_info "Model capabilities: Uncensored image generation with automatic watermarking"
    print_info "All images: © 2026 Thox.ai LLC"
}

# Function to show examples
show_examples() {
    cat << EOF
${GREEN}Example Prompts for Thox Imagine:${NC}

${BLUE}Photorealistic:${NC}
"Ultra-realistic portrait of a wise elder, candlelit room, Rembrandt lighting, 8k detail"

${BLUE}Artistic:${NC}
"Surrealist dreamscape with floating islands, Salvador Dali inspired, vibrant colors"

${BLUE}Abstract:${NC}
"Dynamic fluid simulation, iridescent colors, macro photography, black background"

${BLUE}Concept Art:${NC}
"Futuristic cyberpunk city, neon lights, rain-soaked streets, blade runner aesthetic"

${BLUE}Nature:${NC}
"Majestic waterfall in ancient forest, golden hour lighting, mist and rainbows"

${BLUE}Fantasy:${NC}
"Epic dragon perched on mountain peak, storm clouds, dramatic composition"

${BLUE}Architecture:${NC}
"Modern minimalist building, glass and steel, sunset reflection, architectural photography"

${BLUE}Characters:${NC}
"Steampunk inventor in workshop, intricate mechanical details, warm lighting"
EOF
}

# Function for interactive mode
interactive_mode() {
    print_info "Thox Imagine - Interactive Mode"
    echo ""

    read -p "$(echo -e ${GREEN})Enter your image prompt: $(echo -e ${NC})" prompt

    if [ -z "$prompt" ]; then
        print_error "Prompt cannot be empty"
        exit 1
    fi

    read -p "$(echo -e ${YELLOW})Add style modifiers (optional, press Enter to skip): $(echo -e ${NC})" modifiers

    if [ -n "$modifiers" ]; then
        full_prompt="$prompt, $modifiers"
    else
        full_prompt="$prompt"
    fi

    echo ""
    print_info "Final prompt: $full_prompt"
    read -p "$(echo -e ${GREEN})Generate image? (y/n): $(echo -e ${NC})" confirm

    if [[ $confirm == [yY] ]]; then
        generate_image "$full_prompt"
    else
        print_warning "Generation cancelled"
    fi
}

# Function to list generated images
list_images() {
    print_info "Generated images in $OUTPUT_DIR:"
    echo ""
    if [ -d "$OUTPUT_DIR" ] && [ "$(ls -A $OUTPUT_DIR)" ]; then
        ls -lh "$OUTPUT_DIR" | tail -n +2
    else
        print_warning "No images found. Generate some first!"
    fi
}

# Main script logic
case "${1}" in
    -h|--help)
        show_usage
        ;;
    -m|--model)
        show_model_info
        ;;
    -e|--examples)
        show_examples
        ;;
    -i|--interactive)
        interactive_mode
        ;;
    -l|--list)
        list_images
        ;;
    "")
        print_error "No prompt provided"
        echo ""
        show_usage
        exit 1
        ;;
    *)
        generate_image "$1"
        ;;
esac
