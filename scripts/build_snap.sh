#!/bin/bash
set -euo pipefail

echo "=== Building REChain Snap package ==="

# Check if snapcraft is installed
if ! command -v snapcraft &> /dev/null; then
    echo "snapcraft not found. Installing..."
    sudo snap install snapcraft --classic
fi

# Navigate to snap directory
cd snap

# Build the snap package
echo "Building snap package..."
snapcraft

echo "Snap package built successfully!"
echo "Package location: $(pwd)/rechainonline_*.snap"
