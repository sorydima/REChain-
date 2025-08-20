#!/bin/bash
set -euo pipefail

# Flutter path
FLUTTER_PATH="/home/sorydev/flutter/bin/flutter"

echo "=== Building REChain Linux packages ==="
echo "For detailed instructions, see BUILD_LINUX_PACKAGES.md"

# Build Flutter Linux release
echo "Building Flutter Linux release..."
"$FLUTTER_PATH" build linux --release

# Snap package
echo "Building Snap package..."
cd snap
snapcraft
cd ..

# Flatpak package
echo "Building Flatpak package..."
cd com.rechain.online
flatpak-builder --force-clean --install-deps-from=flathub build-dir com.rechain.online.json
cd ..

# AppImage package
echo "Building AppImage package..."
cd appimage
cp -r ../build/linux/x64/release/bundle REChain.AppDir
cp REChain.desktop REChain.AppDir/
mkdir -p REChain.AppDir/usr/share/icons
cp ../assets/logo.svg REChain.AppDir/usr/share/icons/REChain.svg
cp AppRun REChain.AppDir/
chmod +x REChain.AppDir/AppRun
appimagetool REChain.AppDir
cd ..

# RPM package
echo "Building RPM package..."
rpmbuild -bb packages/rpm/SPECS/rechainonline.spec

echo "All Linux packages built successfully!"
