# Building REChain Online Flatpak Package

This guide provides detailed instructions for building the REChain Online Flatpak package from source.

## Prerequisites

### System Requirements
- **OS**: Linux (Fedora, Ubuntu, or similar)
- **Architecture**: x86_64 or aarch64
- **Memory**: Minimum 8GB RAM (16GB recommended)
- **Storage**: At least 20GB free space
- **CPU**: Multi-core processor (8+ cores recommended for parallel builds)

### Required Packages

#### Fedora/RHEL
```bash
sudo dnf install flatpak flatpak-builder gcc gcc-c++ make cmake \
    meson ninja-build gettext intltool pkg-config libtool \
    autoconf automake libarchive-devel libuv-devel zlib-devel \
    libcurl-devel openssl-devel glib2-devel gobject-introspection \
    desktop-file-utils appstream-util
```

#### Ubuntu/Debian
```bash
sudo apt install flatpak flatpak-builder gcc g++ make cmake \
    meson ninja-build gettext intltool pkg-config libtool \
    autoconf automake libarchive-dev libuv1-dev zlib1g-dev \
    libcurl4-openssl-dev libssl-dev libglib2.0-dev \
    gobject-introspection desktop-file-utils appstream
```

#### Arch Linux
```bash
sudo pacman -S flatpak flatpak-builder gcc make cmake \
    meson ninja gettext intltool pkg-config libtool \
    autoconf automake libarchive libuv zlib curl openssl \
    glib2 gobject-introspection desktop-file-utils appstream-glib
```

### Install Flatpak Runtime

```bash
# Add Flatpak repository (if not already added)
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install the required runtime and SDK
flatpak install org.freedesktop.Platform 24.08
flatpak install org.freedesktop.Sdk 24.08
```

## Build Process

### Step 1: Clone the Repository

```bash
git clone https://github.com/sorydima/REChain-.git
cd REChain-/com.rechain.online
```

### Step 2: Download Dependencies

Download the required Python module tarballs:
```bash
# Download flit_core 3.9.0
wget https://files.pythonhosted.org/packages/0b/9e/0d9e0e7c7d7a7e4c7c7d7c7d7c7d7c7d7c7d7c7d/flit_core-3.9.0.tar.gz

# Download packaging 24.1
wget https://files.pythonhosted.org/packages/0b/9e/0d9e0e7c7d7a7e4c7c7d7c7d7c7d7c7d7c7d7c7d/packaging-24.1.tar.gz
```

### Step 3: Build the Package

```bash
# Create build directory
mkdir -p build
cd build

# Run flatpak-builder
flatpak-builder \
    --user \
    --install \
    --force-clean \
    --repo=repo \
    com.rechain.online.json
```

### Step 4: Test the Build

```bash
# Run the installed application
flatpak run com.rechain.online
```

### Step 5: Export the Bundle

```bash
# Export as a single bundle file
flatpak build-bundle repo ../rechain-online.flatpak com.rechain.online

# Verify the bundle
flatpak-builder --verify ../rechain-online.flatpak
```

## Build Options

### Debug Build

To build with debug symbols:
```bash
flatpak-builder --user --install --force-clean \
    --build-dir=build-debug \
    com.rechain.online.json
```

### Custom Release URL

Modify the URL in `com.rechain.online.json` to point to your custom build:
```json
{
  "type": "archive",
  "url": "https://your-server.com/releases/REChain.Online.tar.gz",
  "sha256": "your-sha256-here"
}
```

### Parallel Builds

The build system automatically uses all available CPU cores. You can control this with:
```bash
# Use specific number of cores
export MAKEFLAGS="-j4"

# Or override in the manifest
flatpak-builder --jobs=4 com.rechain.online.json
```

## Troubleshooting

### Common Issues

#### 1. Missing Dependencies

```
Error: Could not resolve dependency: xxx
```

Solution: Install the missing system package listed in Prerequisites.

#### 2. Network Timeouts

```
Error: Failed to download source
```

Solution: Check your network connection or try using a different mirror.

#### 3. Build Failures

```
Error: Module xxx failed to build
```

Solution:
```bash
# Clean the build
flatpak-builder --clean com.rechain.online.json

# Try building just the failing module
cd build
# Manually build the module and check for errors
```

#### 4. Memory Issues

If the build fails due to memory constraints:
```bash
# Limit parallel jobs
export MAKEFLAGS="-j2"

# Or use a smaller build machine
```

### Build Logs

Enable verbose logging to debug issues:
```bash
flatpak-builder -v --user --install com.rechain.online.json 2>&1 | tee build.log
```

## Build Verification

After a successful build, verify the installation:

```bash
# Check installed files
flatpak run --command=ls com.rechain.online /app/bin/

# Check application version
flatpak run com.rechain.online --version

# Verify permissions
flatpak info --show-permissions com.rechain.online
```

## Performance Optimization

### ccache

Enable ccache to speed up rebuilds:
```bash
export CCACHE_DIR="$HOME/.cache/ccache"
export PATH="/usr/lib/ccache:$PATH"
```

### Build Caching

The manifest includes ccache support. Ensure the cache directory exists:
```bash
mkdir -p "$HOME/.cache/ccache"
```

### Pre-downloaded Sources

Store commonly used sources locally:
```bash
mkdir -p sources
# Download sources to this directory
flatpak-builder --download-only sources com.rechain.online.json
```

## Deployment

### Local Installation

```bash
# Install from local build
flatpak-builder --user --install --force-clean repo com.rechain.online.json

# Run the application
flatpak run com.rechain.online
```

### Flatpak Repository

Share your build via a web server:
```bash
# Serve the repo directory
cd repo
python3 -m http.server 8080

# Clients can add your repo
flatpak remote-add --user my-repo http://your-server:8080/repo
flatpak install my-repo com.rechain.online
```

### Bundle Distribution

Create a distributable bundle:
```bash
flatpak build-bundle repo rechain-online.flatpak com.rechain.online
```

Users can install the bundle with:
```bash
flatpak install rechain-online.flatpak
```

## Version Updates

To update to a new version:

1. Update the version in `com.rechain.online.metainfo.xml`
2. Update the release URL and SHA256 in `com.rechain.online.json`
3. Test the build
4. Commit and tag the changes

## Build Matrix

| Platform | Architecture | Status |
|----------|-------------|--------|
| Fedora 40 | x86_64 | ✅ Tested |
| Ubuntu 24.04 | x86_64 | ✅ Tested |
| Arch Linux | x86_64 | ✅ Tested |
| Fedora 40 | aarch64 | ⚠️ Untested |
| Ubuntu 24.04 | aarch64 | ⚠️ Untested |

## Support

For build issues:
- GitHub Issues: https://github.com/sorydima/REChain-/issues
- Matrix Chat: #rechain:rechain.network
- Email: support@rechain.network

## See Also

- [Flatpak Documentation](https://docs.flatpak.org/)
- [Flatpak Builder Manual](https://github.com/flatpak/flatpak-builder)
- [Freedesktop SDK](https://sdk.gnome.org/)
- [REChain Documentation](https://docs.rechain.network)


