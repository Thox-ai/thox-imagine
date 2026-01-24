# Thox Imagine - Distribution Guide

**Model**: Thox-ai/thox-imagine
**Issue**: Cannot push to Ollama registry (derivative model restriction)
**Status**: Alternative distribution methods available

---

## ❌ Ollama Registry Publishing Issue

When attempting to publish to Ollama's public registry:

```bash
ollama push Thox-ai/thox-imagine:latest
# Error: status 500: {"errors":[{"code":"INTERNAL_ERROR","message":"internal error"}]}
```

**Reason**: The model is based on `x/flux2-klein`, and Ollama may have restrictions on publishing derivative models to their public registry.

---

## ✅ Alternative Distribution Methods

### Method 1: GitHub Repository (Recommended)

Create a public GitHub repository with the Modelfile and documentation.

**Steps**:

1. **Create GitHub Repository**
```bash
# Create a new directory for the repo
mkdir thox-imagine-model
cd thox-imagine-model

# Initialize git
git init

# Copy files
cp ~/Modelfile.thox-imagine ./Modelfile
cp ~/THOX_IMAGINE_README.md ./README.md
cp ~/THOX_IMAGINE_QUICKSTART.md ./
cp ~/THOX_IMAGINE_LICENSE.md ./LICENSE.md
cp ~/thox-imagine-cli.sh ./
cp ~/thox_imagine_api.py ./
cp ~/thox-imagine-demo.sh ./
cp ~/thox-imagine-node-example.ts ./
```

2. **Create Installation Script**
```bash
cat > install.sh << 'EOF'
#!/bin/bash
echo "Installing Thox Imagine model..."

# Check if ollama is installed
if ! command -v ollama &> /dev/null; then
    echo "Error: Ollama is not installed"
    echo "Please install from: https://ollama.ai"
    exit 1
fi

# Check if base model exists
if ! ollama list | grep -q "x/flux2-klein"; then
    echo "Pulling base model x/flux2-klein..."
    ollama pull x/flux2-klein
fi

# Create the model
echo "Creating Thox Imagine model..."
ollama create Thox-ai/thox-imagine -f Modelfile

echo "✅ Thox Imagine installed successfully!"
echo "Test it with: ollama run Thox-ai/thox-imagine 'A beautiful sunset'"
EOF

chmod +x install.sh
```

3. **Push to GitHub**
```bash
# Add all files
git add .

# Commit
git commit -m "Initial release of Thox Imagine v1.0.0"

# Create repo on GitHub and push
git remote add origin https://github.com/Thox-ai/thox-imagine.git
git branch -M main
git push -u origin main
```

4. **Users install via**:
```bash
git clone https://github.com/Thox-ai/thox-imagine.git
cd thox-imagine
./install.sh
```

---

### Method 2: Hugging Face Hub

Publish to Hugging Face as a model repository.

**Steps**:

1. **Create Hugging Face Account**
   - Go to https://huggingface.co
   - Create account or login

2. **Create New Model Repository**
   - Click "New Model"
   - Name: `thox-imagine`
   - License: Apache 2.0
   - Make it public

3. **Upload Files**
```bash
# Install huggingface-hub
pip install huggingface-hub

# Login
huggingface-cli login

# Upload
huggingface-cli upload Thox-ai/thox-imagine \
    Modelfile.thox-imagine \
    THOX_IMAGINE_README.md \
    THOX_IMAGINE_QUICKSTART.md \
    thox-imagine-cli.sh \
    thox_imagine_api.py
```

4. **Users install via**:
```bash
# Download from HF
wget https://huggingface.co/Thox-ai/thox-imagine/resolve/main/Modelfile.thox-imagine

# Create model
ollama create Thox-ai/thox-imagine -f Modelfile.thox-imagine
```

---

### Method 3: Docker Container

Package as a Docker container with Ollama.

**Dockerfile**:
```dockerfile
FROM ollama/ollama:latest

# Copy Modelfile
COPY Modelfile.thox-imagine /root/Modelfile.thox-imagine

# Pull base model and create Thox Imagine
RUN ollama serve & sleep 5 && \
    ollama pull x/flux2-klein && \
    ollama create Thox-ai/thox-imagine -f /root/Modelfile.thox-imagine

EXPOSE 11434

CMD ["ollama", "serve"]
```

**Build and Publish**:
```bash
# Build
docker build -t thoxai/thox-imagine:latest .

# Push to Docker Hub
docker push thoxai/thox-imagine:latest
```

**Users run via**:
```bash
docker run -d -p 11434:11434 thoxai/thox-imagine:latest
```

---

### Method 4: Direct File Distribution

Share the Modelfile and scripts directly.

**Create Distribution Package**:
```bash
# Create package
mkdir thox-imagine-v1.0.0
cd thox-imagine-v1.0.0

# Copy all files
cp ~/Modelfile.thox-imagine ./
cp ~/THOX_IMAGINE_*.md ./
cp ~/thox-imagine-*.sh ./
cp ~/thox_imagine_api.py ./
cp ~/thox-imagine-node-example.ts ./

# Create README
cat > INSTALL.md << 'EOF'
# Thox Imagine Installation

1. Ensure Ollama is installed: https://ollama.ai
2. Pull base model: `ollama pull x/flux2-klein`
3. Create model: `ollama create Thox-ai/thox-imagine -f Modelfile.thox-imagine`
4. Test: `ollama run Thox-ai/thox-imagine "A beautiful sunset"`

For full documentation, see THOX_IMAGINE_README.md
EOF

# Create archive
cd ..
tar -czf thox-imagine-v1.0.0.tar.gz thox-imagine-v1.0.0/
zip -r thox-imagine-v1.0.0.zip thox-imagine-v1.0.0/
```

**Share via**:
- Website download
- Email
- Cloud storage (Dropbox, Google Drive)
- Release on GitHub

---

### Method 5: Private Ollama Registry

Host your own Ollama registry.

**Not officially supported yet, but coming soon to Ollama**

---

## 🎯 Recommended Approach

**Best for Most Users**: **GitHub Repository + Releases**

### Complete GitHub Setup

```bash
# 1. Create repository structure
mkdir -p thox-imagine-official
cd thox-imagine-official

# 2. Copy all files
cp ~/Modelfile.thox-imagine ./Modelfile
cp ~/THOX_IMAGINE_README.md ./README.md
cp ~/THOX_IMAGINE_QUICKSTART.md ./QUICKSTART.md
cp ~/THOX_IMAGINE_LICENSE.md ./LICENSE.md
cp ~/THOX_IMAGINE_SUMMARY.md ./SUMMARY.md
cp ~/thox-imagine-cli.sh ./
cp ~/thox_imagine_api.py ./
cp ~/thox-imagine-demo.sh ./
cp ~/thox-imagine-node-example.ts ./

# 3. Create installer
cat > install.sh << 'EOF'
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
EOF

chmod +x install.sh
chmod +x thox-imagine-cli.sh
chmod +x thox_imagine_api.py
chmod +x thox-imagine-demo.sh

# 4. Create .gitignore
cat > .gitignore << 'EOF'
thox-imagine-outputs/
*.png
*.jpg
.DS_Store
__pycache__/
*.pyc
node_modules/
EOF

# 5. Initialize git
git init
git add .
git commit -m "Initial release: Thox Imagine v1.0.0"

# 6. Create on GitHub and push
echo ""
echo "Next steps:"
echo "1. Create repo at: https://github.com/new"
echo "2. Name it: thox-imagine"
echo "3. Run:"
echo "   git remote add origin https://github.com/Thox-ai/thox-imagine.git"
echo "   git branch -M main"
echo "   git push -u origin main"
```

---

## 📦 Creating GitHub Release

After pushing to GitHub:

1. Go to your repository on GitHub
2. Click "Releases" → "Create a new release"
3. Tag: `v1.0.0`
4. Title: `Thox Imagine v1.0.0 - Initial Release`
5. Description:
```markdown
# Thox Imagine v1.0.0

AI Image Generation Model with Automatic Watermarking

## Features
- ✨ Uncensored image generation
- 🔒 Automatic watermark on all images
- 🎨 8B parameter FLUX model
- ⚡ High-quality output

## Installation

```bash
git clone https://github.com/Thox-ai/thox-imagine.git
cd thox-imagine
./install.sh
```

## Quick Start

```bash
ollama run Thox-ai/thox-imagine "A beautiful sunset"
```

## Documentation
- [Full Documentation](README.md)
- [Quick Start Guide](QUICKSTART.md)
- [License](LICENSE.md)

© 2026 Thox.ai LLC. All Rights Reserved.
```

6. Upload these files as release assets:
   - `Modelfile` (renamed from Modelfile.thox-imagine)
   - `thox-imagine-v1.0.0.tar.gz` (if you created archive)

---

## 🌐 Sharing Your Model

### Official Distribution Channels

**GitHub**:
- URL: `https://github.com/Thox-ai/thox-imagine`
- Clone: `git clone https://github.com/Thox-ai/thox-imagine.git`

**Hugging Face**:
- URL: `https://huggingface.co/Thox-ai/thox-imagine`
- Download: `huggingface-cli download Thox-ai/thox-imagine`

**Docker Hub**:
- Pull: `docker pull thoxai/thox-imagine:latest`
- Run: `docker run -p 11434:11434 thoxai/thox-imagine`

**Website**:
- Direct download: `https://thox.ai/downloads/thox-imagine-v1.0.0.tar.gz`

---

## 📢 Promotion Ideas

### README Badge
```markdown
[![Ollama](https://img.shields.io/badge/Ollama-Model-blue)](https://github.com/Thox-ai/thox-imagine)
[![License](https://img.shields.io/badge/License-Apache%202.0-green)](LICENSE.md)
[![Version](https://img.shields.io/badge/Version-1.0.0-orange)](https://github.com/Thox-ai/thox-imagine/releases)
```

### Social Media
- Twitter/X: Share examples with #ThoxImagine #AIArt #Ollama
- Reddit: r/ollama, r/StableDiffusion, r/LocalLLaMA
- Discord: Ollama community server
- LinkedIn: Professional announcement

### Blog Post
Write a technical blog post about:
- Why you created it
- How it works
- Example use cases
- Comparison with other models

---

## 📊 Tracking Usage

### GitHub Stars
Track popularity via GitHub stars

### Download Statistics
- GitHub Releases: View download count
- Hugging Face: View model downloads
- Docker Hub: View pull statistics

### Community Feedback
- GitHub Issues for bug reports
- Discussions for questions
- Pull requests for contributions

---

## 🔄 Future Updates

### Version Naming
- `v1.0.0` - Initial release
- `v1.1.0` - Minor improvements
- `v2.0.0` - Major changes

### Update Process
1. Make changes to Modelfile
2. Update version in README
3. Test thoroughly
4. Commit and tag
5. Create new GitHub release
6. Update Docker image
7. Announce to community

---

## ✅ Distribution Checklist

- [ ] GitHub repository created
- [ ] README.md complete
- [ ] LICENSE.md included
- [ ] install.sh script tested
- [ ] First release published (v1.0.0)
- [ ] Docker image built and pushed (optional)
- [ ] Hugging Face repository created (optional)
- [ ] Documentation website (optional)
- [ ] Blog post announcement (optional)
- [ ] Social media announcements (optional)

---

**Next Steps**: Choose your distribution method and follow the guide above!

**Recommended**: Start with GitHub, it's free, easy, and most developers are familiar with it.

© 2026 Thox.ai LLC. All Rights Reserved.
