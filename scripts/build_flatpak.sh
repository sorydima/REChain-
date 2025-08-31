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

# Use relative path from script location
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FLATPAK_DIR="$SCRIPT_DIR/../com.rechain.dapp"

# Check if flatpak directory exists
if [ ! -d "$FLATPAK_DIR" ]; then
    echo "Error: Flatpak directory not found at $FLATPAK_DIR"
    echo "Please ensure the com.rechain.dapp directory exists in the project root"
    exit 1
fi

# Build the Flatpak
echo "Building Flatpak package..."
cd "$FLATPAK_DIR"
flatpak-builder --force-clean --install-deps-from=flathub build-dir com.rechain.dapp.json

# Export the flatpak
echo "Exporting flatpak..."
flatpak-builder --export-only --install-deps-from=flathub build-dir com.rechain.dapp.json

echo "Flatpak package built successfully!"
echo "Package location: $FLATPAK_DIR/build-dir"
