# Thox Imagine - AI Image Generation Toolkit

**Version**: 1.0.0
**Created**: 2026-01-24
**Powered By**: FLUX2-Klein (8B parameters)
**Organization**: Thox.ai LLC

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE.md)
[![FLUX](https://img.shields.io/badge/FLUX-2--Klein-green)](https://blackforestlabs.ai)
[![Ollama](https://img.shields.io/badge/Ollama-Compatible-brightgreen)](https://ollama.ai)

---

## Overview

**Thox Imagine** is a professional toolkit for AI image generation, providing easy-to-use tools, branded workflows, and professional watermarking capabilities. Built on the powerful FLUX2-Klein model (8B parameters), it delivers high-quality, uncensored image generation with Thox.ai attribution.

### What This Toolkit Provides

- 🛠️ **Easy-to-use tools** - CLI, Python API, and Node.js wrappers
- 🔒 **Automatic watermarking** - Brand your AI-generated images
- 📝 **Prompt templates** - Pre-configured prompts for best results
- 🎨 **Workflow automation** - Batch generation and post-processing
- 📚 **Complete documentation** - Get started in minutes

### Key Features

- ✨ **Uncensored Generation**: No content filtering or safety constraints
- 🎨 **High-Quality Images**: 8B parameter FLUX model with FP4 quantization
- 🔒 **Professional Watermarking**: All images branded with © 2026 Thox.ai LLC
- ⚡ **Fast & Efficient**: Optimized generation workflows
- 🎯 **Literal Interpretation**: Generates exactly what you describe

---

## Installation

### Prerequisites

1. **Install Ollama**: Download from https://ollama.ai
2. **Pull FLUX2-Klein model**:
   ```bash
   ollama pull x/flux2-klein
   ```

### Install Thox Imagine Toolkit

```bash
# Clone repository
git clone https://github.com/YOUR_USERNAME/thox-imagine.git
cd thox-imagine

# Make tools executable
chmod +x install.sh
chmod +x thox-imagine-cli.sh
chmod +x thox_imagine_api.py
chmod +x thox-imagine-demo.sh

# Run installation (optional - sets up environment)
./install.sh
```

---

## Quick Start

### Method 1: Direct Generation

Use the FLUX2-Klein model directly:

```bash
ollama run x/flux2-klein "A beautiful sunset over mountains"
```

### Method 2: CLI Tool (Recommended)

Use the Thox Imagine CLI for a better experience:

```bash
./thox-imagine-cli.sh "A beautiful sunset over mountains"
```

### Method 3: Python API

```python
from thox_imagine_api import ThoxImagineAPI

# Initialize
api = ThoxImagineAPI()

# Generate image
image_path = api.generate_and_save(
    "A serene Japanese garden with cherry blossoms"
)

print(f"Image saved to: {image_path}")
```

### Method 4: Interactive Demo

Try the interactive demo with pre-configured examples:

```bash
./thox-imagine-demo.sh
```

---

## Usage Examples

### Photorealistic Generation

```bash
ollama run x/flux2-klein "Ultra-realistic portrait of an elderly wise man with white beard, soft natural lighting, professional photography, 8k quality, shallow depth of field"
```

### Artistic Styles

```bash
ollama run x/flux2-klein "Impressionist painting of a Parisian cafe at sunset, loose brushstrokes, vibrant colors, Claude Monet style, afternoon light streaming through windows"
```

### Abstract Art

```bash
ollama run x/flux2-klein "Dynamic abstract composition with flowing geometric shapes, gradient colors from deep blue to golden yellow, modern minimalist design, high contrast"
```

### Concept Art

```bash
ollama run x/flux2-klein "Futuristic sci-fi spaceship interior, holographic displays glowing blue, sleek metallic surfaces, cyberpunk aesthetic, dramatic neon lighting, wide angle view"
```

---

## Python API

### Basic Usage

```python
#!/usr/bin/env python3
from thox_imagine_api import ThoxImagineAPI

# Initialize API
api = ThoxImagineAPI()

# Single image generation
image_path = api.generate_and_save(
    prompt="A majestic waterfall in an ancient forest",
    output_path="my_waterfall.png"
)

# Batch generation
prompts = [
    "A sunset over the ocean",
    "A futuristic city at night",
    "An ancient temple in the jungle"
]
paths = api.batch_generate(prompts)

print(f"Generated {len(paths)} images!")
```

### Advanced Usage

```python
from thox_imagine_api import ThoxImagineAPI, ThoxImagineConfig

# Custom configuration
config = ThoxImagineConfig(
    output_dir="my_custom_outputs",
    default_temperature=0.9
)

api = ThoxImagineAPI(config)

# Generate with custom settings
image = api.generate(
    prompt="Your detailed prompt here",
    temperature=0.85,
    top_p=0.92
)
```

---

## Node.js/TypeScript Integration

```typescript
import { ThoxImagineClient } from './thox-imagine-node-example';

const client = new ThoxImagineClient();

// Generate single image
const result = await client.generate(
    'A serene mountain landscape at sunset with colorful sky'
);

console.log('Image saved to:', result.imagePath);

// Batch generation
const prompts = [
    'A peaceful zen garden',
    'An underwater coral reef scene',
    'A cozy library with warm lighting'
];

const results = await client.batchGenerate(prompts);
console.log(`Generated ${results.length} images`);
```

---

## Watermarking

All images generated with Thox Imagine tools are automatically watermarked:

**Watermark Text**:
```
© 2026 Thox.ai LLC. All Rights Reserved. Generated by Thox Imagine.
```

**Watermark Specifications**:
- **Position**: Bottom center of image
- **Font**: Professional sans-serif (Inter/Helvetica-style)
- **Size**: Proportional to image height (~2-3%)
- **Color**: White text on semi-transparent black background (70% opacity)
- **Padding**: 10-15px around text
- **Effect**: Subtle drop shadow for readability

---

## CLI Tool Features

The `thox-imagine-cli.sh` tool provides:

### Interactive Mode
```bash
./thox-imagine-cli.sh --interactive
```

### Show Examples
```bash
./thox-imagine-cli.sh --examples
```

### List Generated Images
```bash
./thox-imagine-cli.sh --list
```

### Model Information
```bash
./thox-imagine-cli.sh --model
```

---

## Prompt Engineering Tips

### Best Practices

1. **Be Specific**: Include details about lighting, style, and composition
2. **Use Descriptive Language**: Rich adjectives and precise nouns
3. **Specify Quality**: Add terms like "8k", "highly detailed", "professional"
4. **Style References**: Mention artistic styles or artists
5. **Technical Details**: Camera angles, depth of field, color palette

### Quality Modifiers

Add these to your prompts for better results:
- `8k quality`
- `highly detailed`
- `professional photography`
- `sharp focus`
- `ray tracing`
- `volumetric lighting`

### Example Progression

**Basic**:
```
"A cat"
```

**Better**:
```
"A fluffy cat sitting on a windowsill"
```

**Best**:
```
"A fluffy Persian cat with blue eyes sitting on a Victorian windowsill, soft natural lighting, professional pet photography, 8k quality, shallow depth of field, golden hour glow"
```

---

## Technical Specifications

| Attribute | Value |
|-----------|-------|
| **Base Model** | FLUX2-Klein |
| **Parameters** | 8.0 Billion |
| **Quantization** | FP4 |
| **Model Size** | 5.7 GB |
| **Content Filter** | None (Uncensored) |
| **License** | Apache 2.0 (base model) |
| **Capabilities** | Text-to-image generation |

### Performance Benchmarks

| Resolution | Avg. Generation Time | Memory Usage |
|------------|---------------------|--------------|
| 512x512    | ~5-8 seconds        | ~6 GB VRAM   |
| 1024x1024  | ~15-20 seconds      | ~8 GB VRAM   |
| 2048x2048  | ~45-60 seconds      | ~12 GB VRAM  |

*Benchmarks based on Apple M-series GPU. Times may vary based on hardware.*

---

## Use Cases

### Creative Industries
- Concept art and visual ideation
- Product visualization and mockups
- Marketing materials and social media content
- Brand imagery and creative assets

### Research & Development
- Visual experimentation and prototyping
- Style exploration and testing
- Design iteration and concept validation

### Personal Projects
- Artistic expression and creativity
- Custom illustrations and artwork
- Personal brand imagery
- Creative exploration

---

## Tools Included

### 1. **install.sh**
One-command installer that sets up the environment and verifies dependencies.

### 2. **thox-imagine-cli.sh**
Interactive command-line interface with guided prompts and examples.

### 3. **thox_imagine_api.py**
Python API wrapper with CLI interface for programmatic access.

### 4. **thox-imagine-demo.sh**
Interactive demo showcasing various generation styles and use cases.

### 5. **thox-imagine-node-example.ts**
TypeScript/Node.js integration examples and client library.

---

## Ethical Use & Responsibilities

⚠️ **Important Notice**

This toolkit provides uncensored image generation. Users are responsible for:

- ✅ Complying with local laws and regulations
- ✅ Respecting intellectual property rights
- ✅ Following platform terms of service
- ✅ Using generated content ethically and appropriately
- ✅ Reviewing images before publication
- ✅ Considering audience and context

**Prohibited Uses**:
- ❌ Illegal content generation
- ❌ Copyright infringement
- ❌ Harmful or malicious content
- ❌ Deceptive or misleading material

---

## Troubleshooting

### Model Not Found

```bash
# Check if FLUX2-Klein is installed
ollama list | grep flux2-klein

# If missing, install it
ollama pull x/flux2-klein
```

### Slow Generation

- Ensure GPU acceleration is enabled
- Close resource-intensive applications
- Consider using lower resolutions for faster results

### Out of Memory

- Generate one image at a time
- Reduce image resolution
- Close other applications
- Increase system RAM if possible

### Permission Errors

```bash
# Make scripts executable
chmod +x thox-imagine-cli.sh thox_imagine_api.py thox-imagine-demo.sh
```

---

## Architecture

```
┌─────────────────────────────────────────┐
│         User Input/Prompt               │
└──────────────┬──────────────────────────┘
               │
               ▼
┌─────────────────────────────────────────┐
│    Thox Imagine CLI/API Tools           │
│    - Prompt optimization                │
│    - Workflow management                │
│    - Output handling                    │
└──────────────┬──────────────────────────┘
               │
               ▼
┌─────────────────────────────────────────┐
│      FLUX2-Klein Base Model             │
│      - 8B parameters                    │
│      - FP4 quantization                 │
│      - Image generation engine          │
└──────────────┬──────────────────────────┘
               │
               ▼
┌─────────────────────────────────────────┐
│    Post-Processing & Watermarking       │
│    - Quality enhancement                │
│    - Automatic watermark                │
│    - Format optimization                │
└──────────────┬──────────────────────────┘
               │
               ▼
┌─────────────────────────────────────────┐
│      Final Branded Image                │
│      © 2026 Thox.ai LLC                 │
└─────────────────────────────────────────┘
```

---

## Version History

### v1.0.0 (2026-01-24)
- ✨ Initial release
- 🛠️ CLI, Python API, and Node.js tools
- 🔒 Automatic watermarking system
- 📝 Comprehensive documentation
- 🎨 Prompt templates and examples
- 🚀 Batch generation support
- 📦 One-command installation

---

## Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

---

## Support & Contact

**Organization**: Thox.ai LLC
**Website**: https://thox.ai
**Email**: support@thox.ai
**Enterprise**: enterprise@thox.ai

**Creator**: Tommy Xaypanya, Chief AI & Quantum Systems Officer

---

## License

**Base Model (FLUX2-Klein)**: Apache 2.0 License
**Thox Imagine Toolkit**: © 2026 Thox.ai LLC. All Rights Reserved.

All images generated using this toolkit are automatically watermarked and attributed to Thox.ai LLC.

See [LICENSE.md](LICENSE.md) for full license details.

---

## Acknowledgments

- **FLUX2-Klein**: Base image generation model
- **Ollama**: Local model deployment platform
- **Black Forest Labs**: FLUX model development

---

## Quick Reference

```bash
# Installation
ollama pull x/flux2-klein
git clone https://github.com/YOUR_USERNAME/thox-imagine.git
cd thox-imagine && ./install.sh

# Generate image
ollama run x/flux2-klein "Your prompt here"

# Use CLI tool
./thox-imagine-cli.sh "Your prompt here"

# Python API
python3 thox_imagine_api.py "Your prompt here"

# Interactive demo
./thox-imagine-demo.sh
```

---

**Built with ❤️ for the AI art community**

**© 2026 Thox.ai LLC. All Rights Reserved.**

Generated by Thox Imagine v1.0.0
