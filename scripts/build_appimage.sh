#!/bin/bash
set -euo pipefail

# Flutter path
FLUTTER_PATH="/home/sorydev/flutter/bin/flutter"

echo "=== Building REChain AppImage package ==="

# Check if appimagetool is installed
if ! command -v appimagetool &> /dev/null; then
    echo "appimagetool not found. Installing..."
    wget -O appimagetool "https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage"
    chmod +x appimagetool
    sudo mv appimagetool /usr/local/bin/
fi

# Use relative path to appimage directory from script location
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APPIMAGE_DIR="$SCRIPT_DIR/../appimage"

# Build Flutter Linux release if not already built
if [ ! -d "$SCRIPT_DIR/../build/linux/x64/release/bundle" ]; then
    echo "Building Flutter Linux release..."
    "$FLUTTER_PATH" build linux --release
fi

# Prepare AppImage directory structure
echo "Preparing AppImage directory structure..."
rm -rf "$APPIMAGE_DIR/REChain.AppDir"
cp -r "$SCRIPT_DIR/../build/linux/x64/release/bundle" "$APPIMAGE_DIR/REChain.AppDir"
cp "$APPIMAGE_DIR/REChain.desktop" "$APPIMAGE_DIR/REChain.AppDir/"

# Create icon directory and copy icon
mkdir -p "$APPIMAGE_DIR/REChain.AppDir/usr/share/icons"
if [ -f "$SCRIPT_DIR/../assets/logo.svg" ]; then
    cp "$SCRIPT_DIR/../assets/logo.svg" "$APPIMAGE_DIR/REChain.AppDir/usr/share/icons/REChain.svg"
    cp "$SCRIPT_DIR/../assets/logo.svg" "$APPIMAGE_DIR/REChain.AppDir/REChain.svg"
    echo "Copied SVG icon"
elif [ -f "$SCRIPT_DIR/../assets/logo.png" ]; then
    cp "$SCRIPT_DIR/../assets/logo.png" "$APPIMAGE_DIR/REChain.AppDir/REChain.png"
    echo "Copied PNG icon"
elif [ -f "$SCRIPT_DIR/../assets/logo.jpg" ]; then
    cp "$SCRIPT_DIR/../assets/logo.jpg" "$APPIMAGE_DIR/REChain.AppDir/REChain.jpg"
    echo "Copied JPG icon"
else
    echo "Warning: No logo file found in assets directory"
    # Create a simple placeholder icon
    echo "Creating placeholder icon..."
    echo "REChain" > "$APPIMAGE_DIR/REChain.AppDir/REChain.png"
fi

# Copy AppRun and make executable
cp "$APPIMAGE_DIR/AppRun" "$APPIMAGE_DIR/REChain.AppDir/"
chmod +x "$APPIMAGE_DIR/REChain.AppDir/AppRun"

# Build the AppImage
echo "Building AppImage..."
appimagetool "$APPIMAGE_DIR/REChain.AppDir"

echo "AppImage package built successfully!"
echo "Package location: $APPIMAGE_DIR/REChain-x86_64.AppImage"
