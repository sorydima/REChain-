# REChain Aurora OS Changelog
# Version: 4.1.10+1160
# Last Updated: 2025-12-06

---

## v4.1.10+1160 (2025-12-06)

### Added
- ✅ Aurora OS 4.2 support
- ✅ Enhanced notification service with group notifications
- ✅ Improved sensor integration (accelerometer, proximity, light)
- ✅ Background services with UnifiedPush support
- ✅ Battery optimization features
- ✅ Memory management system
- ✅ Crash reporting with stack trace collection
- ✅ Performance profiling tools
- ✅ Multi-architecture support (armv7l, aarch64, x86_64)
- ✅ RPM/DEB packaging support

### Changed
- 🔄 Updated CMake configuration for CMake 3.20+
- 🔄 Improved Qt5 integration with latest Qt5.15 LTS
- 🔄 Enhanced CMakeLists.txt with better C++20 support
- 🔄 Updated build system for faster compilation
- 🔄 Improved logging configuration
- 🔄 Enhanced security features

### Fixed
- 🐛 Fixed notification icons not showing
- 🐛 Fixed crash on startup when permissions denied
- 🐛 Fixed memory leak in notification service
- 🐛 Fixed sensor readings when screen off
- 🐛 Fixed background sync not respecting battery mode
- 🐛 Fixed app lock not working with biometrics

### Performance
- ⚡ Reduced startup time by 30%
- ⚡ Optimized memory usage (-50MB)
- ⚡ Improved notification rendering
- ⚡ Better battery life in background mode

---

## v4.1.10+1152 (2025-07-08)

### Added
- ✅ Initial Aurora OS release
- ✅ Matrix protocol support with Synapse
- ✅ End-to-end encryption (Olm/Megolm)
- ✅ Basic notification service
- ✅ System integration (lipstick)
- ✅ Crash reporting
- ✅ Configuration management
- ✅ Logging system

### Features
- 🔐 E2E encrypted messaging
- 💬 Matrix chat rooms
- 👤 User profiles
- 📱 Contact synchronization
- 🔔 Push notifications
- 📎 File attachments
- 🌐 Federation support
- 🌉 Bridge support (Telegram)

### Known Issues
- ⚠️ Some emoji not rendering correctly
- ⚠️ Limited theme customization
- ⚠️ No voice message support yet

---

## v4.1.9+1147 (2025-06-01)

### Changed
- 🔄 Pre-release for Aurora OS development
- 🔄 Migrated from Silica to Aurora Components
- 🔄 Updated build system

---

## Installation

### Via RPM (Recommended for Aurora OS)

```bash
# Install
sudo rpm -ivh com.rechain.online-4.1.10+1160-1.armv7hl.rpm

# Update
sudo rpm -Uvh com.rechain.online-4.1.10+1160-1.armv7hl.rpm

# Remove
sudo rpm -e com.rechain.online
```

### Via DEB

```bash
# Install
sudo dpkg -i com.rechain.online_4.1.10+1160_armhf.deb

# Fix dependencies
sudo apt-get install -f

# Remove
sudo dpkg -r com.rechain.online
```

### Manual Installation

```bash
# Extract bundle
tar -xzf com.rechain.online-4.1.10+1160.tar.gz

# Install
sudo cp -r bundle/* /usr/share/com.rechain.online/
sudo cp icons/*.png /usr/share/icons/hicolor/*/apps/
sudo cp desktop/com.rechain.online.desktop /usr/share/applications/
sudo ln -sf /usr/share/com.rechain.online/rechainonline /usr/bin/rechainonline
```

---

## System Requirements

| Requirement | Minimum | Recommended |
|-------------|---------|-------------|
| Aurora OS Version | 4.0 | 4.2+ |
| CPU | ARMv7 (1 GHz) | ARMv8 (1.5 GHz) |
| RAM | 1 GB | 2 GB |
| Storage | 500 MB | 1 GB |

---

## Dependencies

### Required
- Qt5 Core >= 5.15
- Qt5 DBus >= 5.15
- Qt5 Multimedia >= 5.15
- Qt5 Network >= 5.15
- Qt5 Sensors >= 5.15
- libflutter-embedder >= 1.0
- aurora-sdk >= 1.0

### Optional
- libsqlite3 (for local cache)
- libssl (for encryption)

---

## Support

- **Issues:** https://github.com/sorydima/REChain-/issues
- **Matrix Community:** #chatting:matrix.katya.wtf
- **Email:** dim15168250@yandex.ru
- **Aurora OS Forum:** https://forum.aurora-os.org

---

## License

REChain is licensed under the Apache License 2.0.

See LICENSE file for details.

---

**REChain: Building the Digital Infrastructure of Autonomous Organizations** 🚀

