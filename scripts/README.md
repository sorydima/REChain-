# REChain Build Scripts

This directory contains scripts for building and packaging the REChain project for various platforms and formats.

## Linux Packaging Scripts

### build_linux_packages.sh
Builds all Linux package formats (Snap, Flatpak, AppImage, RPM) in sequence.

Usage:
```bash
./scripts/build_linux_packages.sh
```

### build_snap.sh
Builds the Snap package for REChain.

Prerequisites:
- snapcraft

Usage:
```bash
./scripts/build_snap.sh
```

### build_flatpak.sh
Builds the Flatpak package for REChain.

Prerequisites:
- flatpak
- flatpak-builder

Usage:
```bash
./scripts/build_flatpak.sh
```

### build_appimage.sh
Builds the AppImage package for REChain.

Prerequisites:
- appimagetool

Usage:
```bash
./scripts/build_appimage.sh
```

### build_rpm.sh
Builds the RPM package for REChain.

Prerequisites:
- rpm-build

Usage:
```bash
./scripts/build_rpm.sh
```

## Android Build Scripts

### prebuild_codemagic_fixed.sh
Prepares the environment for Android builds on Codemagic CI/CD platform.

Usage:
```bash
./scripts/prebuild_codemagic_fixed.sh
```

## Documentation

### BUILD_LINUX_PACKAGES.md
Comprehensive guide for building and packaging REChain for Linux distributions.

## Other Scripts

Additional scripts for specific build tasks and platform preparations.

## Usage

To build REChain for any platform:

1. Ensure you have the required prerequisites installed
2. Run the appropriate build script for your target platform
3. Find the resulting package in the specified output directory

For detailed instructions, refer to BUILD_LINUX_PACKAGES.md.
