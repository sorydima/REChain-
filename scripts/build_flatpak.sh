#!/bin/bash
set -euo pipefail

echo "=== Building REChain Flatpak package ==="

# Check if flatpak-builder is installed
if ! command -v flatpak-builder &> /dev/null; then
    echo "flatpak-builder not found. Installing..."
    sudo apt install flatpak-builder
fi

# Add Flathub repository if not present
if ! flatpak remote-list | grep -q flathub; then
    echo "Adding Flathub repository..."
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

# Navigate to flatpak directory
cd com.rechain.online

# Build the flatpak package
echo "Building flatpak package..."
flatpak-builder --force-clean --install-deps-from=flathub build-dir com.rechain.online.json

# Export the flatpak
echo "Exporting flatpak..."
flatpak-builder --export-only --install-deps-from=flathub build-dir com.rechain.online.json

echo "Flatpak package built successfully!"
echo "Package location: $(pwd)/build-dir"
