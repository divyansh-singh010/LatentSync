#!/bin/bash

# Install ffmpeg
apt-get update && apt-get install -y ffmpeg

# Install dependencies
pip install -r requirements.txt

# Install OpenCV dependencies
apt-get install -y libgl1

# Install Hugging Face CLI
pip install huggingface_hub

# Download all the checkpoints from HuggingFace
huggingface-cli download ByteDance/LatentSync --local-dir checkpoints --exclude "*.git*" "README.md"

# Create cache directory for auxiliary models
mkdir -p /root/.cache/torch/hub/checkpoints

# Soft links for the auxiliary models
ln -s $(pwd)/checkpoints/auxiliary/2DFAN4-cd938726ad.zip /root/.cache/torch/hub/checkpoints/2DFAN4-cd938726ad.zip
ln -s $(pwd)/checkpoints/auxiliary/s3fd-619a316812.pth /root/.cache/torch/hub/checkpoints/s3fd-619a316812.pth
ln -s $(pwd)/checkpoints/auxiliary/vgg16-397923af.pth /root/.cache/torch/hub/checkpoints/vgg16-397923af.pth

echo "✅ Setup completed successfully!"
