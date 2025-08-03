#!/bin/bash
set -euo pipefail

echo "=== Building REChain AppImage package ==="

# Check if appimagetool is installed
if ! command -v appimagetool &> /dev/null; then
    echo "appimagetool not found. Installing..."
    wget -O appimagetool "https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage"
    chmod +x appimagetool
    sudo mv appimagetool /usr/local/bin/
fi

# Navigate to appimage directory
cd appimage

# Build Flutter Linux release if not already built
if [ ! -d "../build/linux/x64/release/bundle" ]; then
    echo "Building Flutter Linux release..."
    cd ..
    flutter build linux --release
    cd appimage
fi

# Prepare AppImage directory structure
echo "Preparing AppImage directory structure..."
rm -rf REChain.AppDir
cp -r ../build/linux/x64/release/bundle REChain.AppDir
cp REChain.desktop REChain.AppDir/
mkdir -p REChain.AppDir/usr/share/icons
cp ../assets/logo.svg REChain.AppDir/usr/share/icons/REChain.svg
cp AppRun REChain.AppDir/
chmod +x REChain.AppDir/AppRun

# Build the AppImage
echo "Building AppImage..."
appimagetool REChain.AppDir

echo "AppImage package built successfully!"
echo "Package location: $(pwd)/REChain-x86_64.AppImage"
