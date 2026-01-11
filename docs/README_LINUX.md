# REChain Linux Implementation

This document provides comprehensive information about the Linux implementation of REChain, including native services, build system, and deployment.

## Overview

The Linux version of REChain includes:
- Native autonomous notification system using libnotify and D-Bus
- Comprehensive crash reporting with signal handling
- Desktop integration with system tray and file associations
- Multiple packaging formats (DEB, RPM, AppImage, Flatpak)
- Automated build and test scripts

## Architecture

### Native Services

#### AutonomousNotificationService
- **File**: `linux/AutonomousNotificationService.h/cc`
- **Purpose**: Manages desktop notifications using libnotify
- **Features**:
  - Multiple notification types (messages, calls, system events)
  - D-Bus integration for external control
  - Sound support with PulseAudio
  - Action buttons and callbacks
  - Notification management and cancellation

#### CrashReportingManager
- **File**: `linux/CrashReportingManager.h/cc`
- **Purpose**: Handles crash reporting and logging
- **Features**:
  - Signal handler for fatal crashes
  - Stack trace generation with backtrace
  - Structured logging with multiple levels
  - System information collection
  - Custom keys and user identification

#### LinuxSystemIntegration
- **File**: `linux/LinuxSystemIntegration.h/cc`
- **Purpose**: Provides desktop environment integration
- **Features**:
  - System tray icon with context menu
  - Desktop file registration
  - Auto-start functionality
  - URL scheme handling
  - Theme detection and power management

### Build System

The Linux build uses CMake with the following key components:

```cmake
# Main dependencies
- GTK+ 3.0 (UI framework)
- libnotify (notifications)
- GIO/GLib (D-Bus and system integration)
- Flutter Linux embedding
```

## Dependencies

### System Requirements
- Linux distribution with GTK+ 3.0 support
- X11 or Wayland display server
- D-Bus session bus
- PulseAudio (for notification sounds)

### Build Dependencies
```bash
# Ubuntu/Debian
sudo apt-get install \
    libgtk-3-dev \
    libnotify-dev \
    libglib2.0-dev \
    cmake \
    ninja-build \
    pkg-config

# Fedora/RHEL
sudo dnf install \
    gtk3-devel \
    libnotify-devel \
    glib2-devel \
    cmake \
    ninja-build \
    pkgconfig
```

### Runtime Dependencies
```bash
# Ubuntu/Debian
sudo apt-get install \
    libgtk-3-0 \
    libnotify4 \
    libglib2.0-0 \
    pulseaudio

# Fedora/RHEL
sudo dnf install \
    gtk3 \
    libnotify \
    glib2 \
    pulseaudio
```

## Building

### Quick Build
```bash
# Navigate to project root
cd /path/to/REChain

# Run build script
./scripts/build_linux.sh
```

### Manual Build
```bash
# Install Flutter dependencies
flutter pub get
flutter config --enable-linux-desktop

# Build Flutter app
flutter build linux --release

# Build native components
cd linux
cmake -B build -S . -DCMAKE_BUILD_TYPE=Release
cmake --build build --parallel $(nproc)
cmake --install build
```

### Build Options
- `BUILD_TYPE`: Debug, Release (default: Release)
- `FLUTTER_BUILD_MODE`: debug, release (default: release)

## Testing

### Automated Testing
```bash
# Run all tests
./scripts/test_linux.sh

# Run specific test categories
./scripts/test_linux.sh --category unit
./scripts/test_linux.sh --category integration
```

### Manual Testing
```bash
# Build and test
./scripts/build_linux.sh clean test

# Run application
./build/linux/bundle/rechainonline
```

### Test Coverage
The test suite includes:
- Unit tests for all native services
- Integration tests for service interaction
- Build system validation
- Dependency checking
- Performance benchmarks
- Security hardening verification

## Packaging

### All Formats
```bash
./scripts/package_linux.sh all
```

### Specific Formats
```bash
# DEB package
./scripts/package_linux.sh deb

# RPM package  
./scripts/package_linux.sh rpm

# AppImage
./scripts/package_linux.sh appimage

# Flatpak
./scripts/package_linux.sh flatpak
```

### Package Details

#### DEB Package
- **Target**: Ubuntu, Debian, derivatives
- **Location**: `packages/rechainonline_VERSION_amd64.deb`
- **Installation**: `sudo dpkg -i rechainonline_VERSION_amd64.deb`

#### RPM Package
- **Target**: Fedora, RHEL, SUSE, derivatives
- **Location**: `packages/rechainonline-VERSION.x86_64.rpm`
- **Installation**: `sudo rpm -i rechainonline-VERSION.x86_64.rpm`

#### AppImage
- **Target**: Universal Linux
- **Location**: `packages/REChain-VERSION-x86_64.AppImage`
- **Usage**: `chmod +x REChain-VERSION-x86_64.AppImage && ./REChain-VERSION-x86_64.AppImage`

#### Flatpak
- **Target**: Sandboxed installation
- **Location**: `packages/REChain-VERSION.flatpak`
- **Installation**: `flatpak install REChain-VERSION.flatpak`

## Configuration

### Application Settings
The application stores configuration in:
- `~/.config/REChain/` - Application settings
- `~/.local/share/REChain/` - User data and logs
- `~/.cache/REChain/` - Temporary files

### Desktop Integration
- Desktop file: `~/.local/share/applications/rechainonline.desktop`
- Auto-start: `~/.config/autostart/rechainonline.desktop`
- Icons: `~/.local/share/icons/hicolor/*/apps/rechainonline.png`

### System Integration
- URL handler: `x-scheme-handler/matrix`
- MIME types: Matrix protocol links
- D-Bus service: `com.rechain.online.Notifications`

## Native Services API

### Notification Service
```cpp
auto& service = AutonomousNotificationService::GetInstance();

// Initialize
service.Initialize();

// Show notifications
service.ShowMessageNotification("Alice", "Hello!", "room_id");
service.ShowCallNotification("Bob", "call_id", true);

// Manage notifications
service.CancelNotification("notification_id");
service.CancelAllNotifications();

// Settings
service.SetNotificationsEnabled(true);
service.SetSoundEnabled(true);
```

### Crash Reporting
```cpp
auto& manager = CrashReportingManager::GetInstance();

// Initialize
manager.Initialize();

// Logging
manager.LogInfo("Application started");
manager.LogError("Connection failed");

// User context
manager.SetUserId("user123");
manager.SetCustomKey("version", "1.0.0");

// Error reporting
manager.RecordError("Network timeout");
```

### System Integration
```cpp
auto& integration = LinuxSystemIntegration::GetInstance();

// Initialize
integration.Initialize();

// Desktop integration
integration.RegisterDesktopEntry();
integration.CreateSystemTrayIcon();
integration.SetAutoStart(true);

// URL handling
integration.RegisterURLScheme("matrix");
```

## Troubleshooting

### Common Issues

#### Build Failures
```bash
# Missing dependencies
sudo apt-get install libgtk-3-dev libnotify-dev

# Flutter not found
export PATH="$PATH:/path/to/flutter/bin"

# CMake version too old
sudo apt-get install cmake=3.16*
```

#### Runtime Issues
```bash
# Missing libraries
ldd ./rechainonline
sudo apt-get install libgtk-3-0 libnotify4

# D-Bus not available
systemctl --user status dbus
```

#### Notification Problems
```bash
# Check notification daemon
ps aux | grep notification
systemctl --user status notification-daemon

# Test libnotify
notify-send "Test" "Notification test"
```

### Debug Mode
```bash
# Build in debug mode
BUILD_TYPE=Debug ./scripts/build_linux.sh

# Run with debug output
FLUTTER_BUILD_MODE=debug ./scripts/build_linux.sh
G_MESSAGES_DEBUG=all ./rechainonline
```

### Log Files
- Application logs: `~/.local/share/REChain/logs/rechain.log`
- Crash reports: `~/.local/share/REChain/logs/crashes/`
- Build logs: `build/linux/build.log`

## Performance

### Optimization
- Release builds use `-O3` optimization
- Native services use efficient C++ implementations
- Minimal memory footprint with smart pointers
- Asynchronous notification handling

### Benchmarks
- Notification latency: < 50ms
- Memory usage: ~100MB base + Flutter overhead
- CPU usage: < 1% idle, < 5% active
- Startup time: < 3 seconds

## Security

### Hardening Features
- RELRO (Relocation Read-Only)
- Stack canaries
- NX bit (No Execute)
- ASLR (Address Space Layout Randomization)

### Sandboxing
- Flatpak provides application sandboxing
- Minimal file system access
- Network access only as needed
- No unnecessary privileges

### Crash Safety
- Signal handlers for graceful crash handling
- Stack trace generation for debugging
- Secure crash report storage
- No sensitive data in crash reports

## Contributing

### Development Setup
```bash
# Clone repository
git clone https://github.com/REChain/REChain.git
cd REChain

# Install dependencies
./scripts/install_linux_deps.sh

# Build and test
./scripts/build_linux.sh clean
./scripts/test_linux.sh
```

### Code Style
- Follow Google C++ Style Guide
- Use clang-format for formatting
- Include comprehensive unit tests
- Document public APIs

### Testing Requirements
- All new features must include tests
- Maintain > 80% code coverage
- Pass all existing tests
- Include integration tests for UI features

## Deployment

### CI/CD Integration
```yaml
# GitHub Actions example
- name: Build Linux
  run: ./scripts/build_linux.sh

- name: Test Linux  
  run: ./scripts/test_linux.sh

- name: Package Linux
  run: ./scripts/package_linux.sh all
```

### Distribution
- Upload packages to GitHub Releases
- Submit to distribution repositories
- Provide installation instructions
- Monitor crash reports and user feedback

## Support

### Getting Help
- GitHub Issues: Bug reports and feature requests
- Documentation: Comprehensive guides and API docs
- Community: Matrix chat room for support
- Email: Technical support contact

### Reporting Issues
Please include:
- Linux distribution and version
- Desktop environment
- Application version
- Steps to reproduce
- Log files and crash reports
