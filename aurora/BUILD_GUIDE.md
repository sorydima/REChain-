# REChain Aurora OS Build Guide
# Version: 4.1.10+1160
# Last Updated: 2025-12-06

---

## 📋 Table of Contents

1. [Overview](#overview)
2. [Prerequisites](#prerequisites)
3. [Environment Setup](#environment-setup)
4. [Building](#building)
5. [Installation](#installation)
6. [Running](#running)
7. [Debugging](#debugging)
8. [Packaging](#packaging)
9. [Troubleshooting](#troubleshooting)

---

## 1. Overview

REChain for Aurora OS is a secure Matrix messenger client built with:
- **Flutter** for UI/UX
- **Qt5** for native Aurora OS integration
- **C++** for performance-critical components
- **CMake** for build management

### Key Features
- End-to-end encrypted messaging
- Matrix protocol support
- Aurora OS native notifications
- System integration (sensors, indicators)
- Crash reporting
- Background services

---

## 2. Prerequisites

### System Requirements

| Component | Minimum | Recommended |
|-----------|---------|-------------|
| CPU | ARMv7 (1 GHz) | ARMv8 (1.5+ GHz) |
| RAM | 1 GB | 2 GB |
| Storage | 500 MB | 1 GB |
| Aurora OS | 4.0 (Sailfish OS 4.5+) | 4.2+ |

### Required Tools

```bash
# CMake 3.16+
cmake --version

# C++ Compiler (GCC 11+ or Clang 14+)
g++ --version

# Qt5 Development Files
pkg-config --modversion Qt5Core

# Flutter SDK (for UI framework)
flutter --version

# Aurora SDK
pkg-config --modversion aurora-sdk

# Additional tools
make, pkg-config, git, wget/curl
```

---

## 3. Environment Setup

### Step 1: Install Aurora SDK

```bash
# Download Aurora SDK
mkdir -p ~/aurora-sdk
cd ~/aurora-sdk
wget https://example.com/aurora-sdk-installer.sh
chmod +x aurora-sdk-installer.sh
./aurora-sdk-installer.sh

# Add to PATH
export PATH="$HOME/aurora-sdk/bin:$PATH"
echo 'export PATH="$HOME/aurora-sdk/bin:$PATH"' >> ~/.bashrc
```

### Step 2: Install Flutter SDK

```bash
# Clone Flutter
git clone https://github.com/flutter/flutter.git -b stable ~/flutter-sdk
export PATH="$HOME/flutter-sdk/bin:$PATH"
echo 'export PATH="$HOME/flutter-sdk/bin:$PATH"' >> ~/.bashrc

# Verify installation
flutter doctor
flutter --version
```

### Step 3: Install Qt5

```bash
# Debian/Ubuntu
sudo apt install qtbase5-dev qtdeclarative5-dev \
    qtmultimedia5-dev libqt5svg5-dev \
    qttools5-dev libqt5xmlpatterns5-dev \
    qtdeclarative5-qtfeedback-dev

# Fedora/RHEL
sudo dnf install qt5-qtbase-devel qt5-qtdeclarative-devel \
    qt5-qtmultimedia-devel qt5-qtsvg-devel

# Verify installation
pkg-config --modversion Qt5Core
```

### Step 4: Set Up Build Environment

```bash
# Create build directory
mkdir -p ~/build-rechain
cd ~/build-rechain

# Clone repository
git clone https://github.com/sorydima/REChain-.git
cd REChain-/aurora

# Initialize submodules
git submodule update --init --recursive
```

---

## 4. Building

### Quick Build

```bash
cd ~/build-rechain/REChain-/aurora

# Create build directory
mkdir build
cd build

# Configure (Debug)
cmake .. \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_SYSTEM_PROCESSOR=armv7l

# Build
make -j$(nproc)

# Build with verbose output
make VERBOSE=1
```

### Build Options

| Option | Description | Default |
|--------|-------------|---------|
| `CMAKE_BUILD_TYPE` | Build type (Debug/Release/RelWithDebInfo) | Release |
| `CMAKE_SYSTEM_PROCESSOR` | Target architecture (armv7l/aarch64/x86_64) | armv7l |
| `ENABLE_TESTS` | Build unit tests | ON |
| `ENABLE_COVERAGE` | Generate code coverage | OFF |

### Build Examples

```bash
# Release build for ARMv7
cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SYSTEM_PROCESSOR=armv7l

# Debug build for debugging
cmake .. \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_SYSTEM_PROCESSOR=armv7l

# Release build with symbols
cmake .. \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_SYSTEM_PROCESSOR=armv7l

# Build for aarch64 (64-bit ARM)
cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SYSTEM_PROCESSOR=aarch64
```

### Build with Ninja (Faster)

```bash
# Install Ninja
sudo apt install ninja-build

# Configure with Ninja
cmake .. -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SYSTEM_PROCESSOR=armv7l

# Build
ninja -j$(nproc)
```

---

## 5. Installation

### Local Installation (Development)

```bash
# Install to system
sudo make install

# Or install to custom location
cmake .. -DCMAKE_INSTALL_PREFIX=/opt/rechain
make
sudo make install
```

### RPM Package Installation

```bash
# Build RPM package
cpack -G RPM

# Install RPM
sudo rpm -ivh com.rechain.online-4.1.10+1160-1.armv7hl.rpm
```

### DEB Package Installation

```bash
# Build DEB package
cpack -G DEB

# Install DEB
sudo dpkg -i com.rechain.online_4.1.10+1160_armhf.deb

# Fix dependencies if needed
sudo apt-get install -f
```

### Manual Installation (From Bundle)

```bash
# Create application directory
sudo mkdir -p /usr/share/com.rechain.online
sudo mkdir -p /usr/share/icons/hicolor/{86x86,108x108,128x128,172x172}/apps

# Copy bundle
sudo cp -r bundle/* /usr/share/com.rechain.online/

# Copy icons
sudo cp icons/*.png /usr/share/icons/hicolor/*/apps/

# Create desktop entry
sudo cp desktop/com.rechain.online.desktop \
    /usr/share/applications/

# Create symlink
sudo ln -sf /usr/share/com.rechain.online/rechainonline \
    /usr/bin/rechainonline
```

---

## 6. Running

### From Command Line

```bash
# Run from build directory
./rechainonline

# Run with environment variables
RECHAIN_DEBUG=1 ./rechainonline

# Run with custom config
RECHAIN_CONFIG=/path/to/config ./rechainonline
```

### From Application Launcher

Search for "REChain" in the Aurora OS application menu.

### With GDB Debugger

```bash
# Start GDB
gdb ./rechainonline

# In GDB:
(gdb) set args --enable-logging
(gdb) run
(gdb) bt  # Backtrace on crash
(gdb) quit
```

---

## 7. Debugging

### Enable Debug Logging

```bash
# Edit logging configuration
nano config/logging.conf

# Set level to Debug
# logging.conf:
# level=Debug
# output=stderr
# tags=enabled
```

### Using Qt Logging

```bash
# Enable Qt debug output
QT_LOGGING_RULES="*.debug=true"
./rechainonline

# Enable specific category
QT_LOGGING_RULES="rechain.service=true"
./rechainonline
```

### Performance Profiling

```bash
# Install perf
sudo apt install linux-tools

# Profile application
perf record -g ./rechainonline
perf report

# Generate flame graph
sudo apt install flamegraph
perf record -g ./rechainonline
perf script | stackcollapse-perf.pl | flamegraph.pl > flamegraph.svg
```

### Memory Analysis

```bash
# Install Valgrind
sudo apt install valgrind

# Run memory check
valgrind --leak-check=full --show-leak-kinds=all \
    --track-origins=yes ./rechainonline 2>&1 | tee valgrind.log
```

---

## 8. Packaging

### Build RPM Package

```bash
cd build
cpack -G RPM

# Result:
# com.rechain.online-4.1.10+1160-1.armv7hl.rpm
```

### Build DEB Package

```bash
cd build
cpack -G DEB

# Result:
# com.rechain.online_4.1.10+1160_armhf.deb
```

### Build Source Package

```bash
cd build
cpack -G TXZ

# Result:
# com.rechain.online-4.1.10+1160.tar.xz
```

### Build AppImage (for testing)

```bash
# Install appimagetool
wget https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage
chmod +x appimagetool-x86_64.AppImage

# Build
./appimagetool-x86_64.AppImage bundle/ rechainonline-4.1.10+1160-x86_64.AppImage
```

---

## 9. Troubleshooting

### Build Errors

#### CMake cannot find Qt5

```bash
# Find Qt5 location
find /usr -name "Qt5Config.cmake" 2>/dev/null

# Set Qt5 path manually
cmake .. -DQt5_DIR=/usr/lib/cmake/Qt5
```

#### Flutter embedder not found

```bash
# Check flutter embedder
pkg-config --libs flutter-embedder

# Install flutter-embedder
sudo apt install libflutter-embedder-dev

# Or set path manually
cmake .. -DFlutterEmbedder_DIR=/path/to/flutter-embedder
```

#### ARM cross-compilation issues

```bash
# Install cross-compilation toolchain
sudo apt install gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf

# Configure with toolchain
cmake .. \
    -DCMAKE_TOOLCHAIN_FILE=../cmake/arm-linux-gnueabihf.cmake \
    -DCMAKE_SYSTEM_PROCESSOR=armv7l
```

### Runtime Errors

#### Application crashes on startup

```bash
# Check dependencies
ldd ./rechainonline | grep "not found"

# Install missing libraries
sudo apt install <missing-library>

# Run with strace
strace -f -o strace.log ./rechainonline
```

#### Black screen / UI not loading

```bash
# Check Flutter assets
ls -la bundle/flutter_assets/

# Verify ICU data file
ls -la bundle/icudtl.dat

# Check logs
RECHAIN_LOG_FILE=/tmp/rechain.log ./rechainonline
cat /tmp/rechain.log
```

#### Notifications not working

```bash
# Check notification service
systemctl status notificationd

# Restart notification service
sudo systemctl restart notificationd

# Check DBus configuration
dbus-send --system --type=method_call \
    --dest=org.freedesktop.Notifications \
    /org/freedesktop/Notifications \
    org.freedesktop.Notifications.GetCapabilities
```

### Performance Issues

#### Slow startup

```bash
# Profile startup time
time ./rechainonline

# Check for missing assets
flutter analyze bundle/flutter_assets/

# Optimize bundle size
flutter build aurora --split-debug-info
```

#### High memory usage

```bash
# Monitor memory
top -p $(pgrep rechainonline)

# Generate memory report
valgrind --tool=massif ./rechainonline
ms_print massif.out.*
```

---

## 📞 Support

- **Issues:** https://github.com/sorydima/REChain-/issues
- **Matrix Community:** #chatting:matrix.katya.wtf
- **Email:** dim15168250@yandex.ru
- **Aurora OS Forum:** https://forum.aurora-os.org

---

## 📝 Version History

| Version | Date | Changes |
|---------|------|---------|
| 4.1.10+1160 | 2025-12-06 | Updated for Aurora OS 4.2 |
| 4.1.10+1152 | 2025-07-08 | Initial Aurora OS support |
| 4.1.9+1147 | 2025-06-01 | Pre-release documentation |

---

**REChain: Building the Digital Infrastructure of Autonomous Organizations** 🚀

