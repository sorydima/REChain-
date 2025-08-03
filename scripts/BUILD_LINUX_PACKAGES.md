# REChain Linux Packaging Guide

This guide explains how to build and package the REChain project for various Linux distributions using different packaging formats.

## Prerequisites

Before building any packages, ensure you have the following installed:

1. Flutter SDK (3.0 or higher)
2. Git
3. Build tools for your target packaging formats

## Package Formats

The REChain project supports the following Linux package formats:

1. Snap
2. Flatpak
3. AppImage
4. RPM

## Building All Packages

To build all package formats at once, run:

```bash
./scripts/build_linux_packages.sh
```

This script will automatically build all package formats sequentially.

## Building Individual Packages

### 1. Snap Package

#### Prerequisites
- snapcraft

Install snapcraft:
```bash
sudo snap install snapcraft --classic
```

#### Build Process
```bash
./scripts/build_snap.sh
```

Or manually:
```bash
cd snap
snapcraft
```

The resulting snap package will be located in the `snap/` directory.

### 2. Flatpak Package

#### Prerequisites
- flatpak
- flatpak-builder

Install Flatpak and flatpak-builder:
```bash
sudo apt install flatpak flatpak-builder
```

Add Flathub repository:
```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

#### Build Process
```bash
./scripts/build_flatpak.sh
```

Or manually:
```bash
cd com.rechain.online
flatpak-builder --force-clean --install-deps-from=flathub build-dir com.rechain.online.json
```

The resulting flatpak package will be in the `com.rechain.online/build-dir` directory.

### 3. AppImage Package

#### Prerequisites
- appimagetool

Install appimagetool:
```bash
wget -O appimagetool "https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage"
chmod +x appimagetool
sudo mv appimagetool /usr/local/bin/
```

#### Build Process
```bash
./scripts/build_appimage.sh
```

Or manually:
```bash
cd appimage
# Build Flutter Linux release if not already built
flutter build linux --release

# Prepare AppImage directory structure
rm -rf REChain.AppDir
cp -r ../build/linux/x64/release/bundle REChain.AppDir
cp REChain.desktop REChain.AppDir/
mkdir -p REChain.AppDir/usr/share/icons
cp ../assets/logo.svg REChain.AppDir/usr/share/icons/REChain.svg
cp AppRun REChain.AppDir/
chmod +x REChain.AppDir/AppRun

# Build the AppImage
appimagetool REChain.AppDir
```

The resulting AppImage will be in the `appimage/` directory.

### 4. RPM Package

#### Prerequisites
- rpm-build

Install rpm-build:
```bash
sudo apt install rpm-build
```

#### Build Process
```bash
./scripts/build_rpm.sh
```

Or manually:
```bash
# Create RPM build directory structure if not exists
mkdir -p ~/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}

# Copy spec file to RPM build directory
cp packages/rpm/SPECS/rechainonline.spec ~/rpmbuild/SPECS/

# Build the RPM package
rpmbuild -bb ~/rpmbuild/SPECS/rechainonline.spec
```

The resulting RPM package will be in `~/rpmbuild/RPMS/x86_64/`.

## Troubleshooting

### Common Issues

1. **Missing dependencies**: Ensure all prerequisites are installed for your target packaging format.

2. **Permission errors**: Some build processes may require sudo privileges.

3. **Flutter build errors**: Ensure you have the correct Flutter version and all dependencies installed.

### Debugging Build Issues

1. Check the build logs for specific error messages.
2. Ensure all paths in the build scripts are correct for your system.
3. Verify that all required tools are properly installed and in your PATH.

## Additional Resources

- [Snapcraft Documentation](https://snapcraft.io/docs)
- [Flatpak Documentation](https://docs.flatpak.org/)
- [AppImage Documentation](https://docs.appimage.org/)
- [RPM Documentation](https://rpm.org/documentation.html)
