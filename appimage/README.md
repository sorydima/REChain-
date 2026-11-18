# REChain AppImage

REChain is provided as an AppImage for easy distribution on Linux systems.

## 📥 Download

Download pre-built AppImages from:
- GitHub Releases: https://github.com/sorydima/REChain-/releases
- Official Website: https://online.rechain.network

## 🚀 Usage

1. **Download the AppImage file**
2. **Make it executable**:
   ```bash
   chmod +x REChain-*.AppImage
   ```
3. **Run the application**:
   ```bash
   ./REChain-*.AppImage
   ```

## 📦 What's Included

- REChain Application (v4.1.20+1162)
- Matrix Protocol Support
- Blockchain Integration (TON, Ethereum, Bitget)
- IPFS Decentralized Storage
- AI Services (Moderation, Translation, Analytics)
- Dynamic Plugin System
- End-to-End Encryption

## 🛠 Building AppImage

### Prerequisites

1. **Flutter SDK** (3.32.8 or higher)
2. **appimagetool** - Get from: https://github.com/AppImage/AppImageKit/releases

### Build Steps

```bash
# 1. Build Flutter application for Linux
flutter build linux

# 2. Create AppDir structure
mkdir -p REChain.AppDir
cp -r build/linux/x64/release/bundle/* REChain.AppDir/

# 3. Prepare AppImage files
cp REChain.desktop REChain.AppDir/
mkdir -p REChain.AppDir/usr/share/icons
cp com.rechain.online.svg REChain.AppDir/usr/share/icons/
cp AppRun REChain.AppDir/

# 4. Download and install required libraries
# Ensure all dependencies are bundled

# 5. Build the AppImage
chmod +x appimagetool
./appimagetool REChain.AppDir REChain-4.1.20+1162-x86_64.AppImage
```

### Optional: Multi-Architecture Build

```bash
# Build for both x64 and arm64
flutter build linux --target-platform linux-arm64

# Create arm64 AppDir
mkdir -p REChain-arm64.AppDir
cp -r build/linux/arm64/release/bundle/* REChain-arm64.AppDir/

# Build arm64 AppImage
./appimagetool REChain-arm64.AppDir REChain-4.1.20+1162-arm64.AppImage
```

## 📋 AppDir Structure

```
REChain.AppDir/
├── usr/
│   ├── bin/
│   │   └── rechainonline
│   ├── lib/
│   │   └── (shared libraries)
│   └── share/
│       ├── icons/
│       │   └── com.rechain.online.svg
│       ├── applications/
│       │   └── REChain.desktop
│       └── metainfo/
│           └── com.rechain.online.appdata.xml
├── rechainonline (main executable)
├── AppRun (launcher script)
└── com.rechain.online.svg (icon)
```

## 🔧 Integration

### Desktop Environment Integration

The AppImage integrates with:
- **GNOME/KDE/XFCE** desktop environments
- **Application menus** and launchers
- **System tray** for notifications
- **File associations** for Matrix links

### MimeType Handler

To handle Matrix URLs:
```bash
# Update mime database
xdg-mime default REChain.desktop x-scheme-handler/rechain

# Associate with matrix:// links
xdg-mime default REChain.desktop x-scheme-handler/matrix
```

## 📝 Requirements

- **Glibc**: 2.28 or higher
- **GTK+**: 3.22 or higher
- **libnotify**: for notifications
- **PulseAudio** or **ALSA**: for audio

## 🐛 Troubleshooting

### Application won't start

1. Check if AppImage is executable:
   ```bash
   ls -la REChain-*.AppImage
   ```

2. Check library dependencies:
   ```bash
   ldd REChain.AppDir/rechainonline
   ```

3. View error logs:
   ```bash
   ./REChain-*.AppImage --verbose 2>&1 | tail -50
   ```

### Missing libraries

If you see library errors, you may need to:
1. Install system dependencies:
   ```bash
   sudo apt install libgtk-3-0 libnotify4 libnss3 libxss1 libxtst6 libasound2
   ```

2. Or use the AppImage with AppImageHub's libglib2.0-0 package

## 🌐 Supported Platforms

- Ubuntu 18.04+
- Fedora 30+
- Debian 10+
- openSUSE 15+
- Arch Linux
- Manjaro
- Elementary OS
- Pop!_OS
- Zorin OS

## 🔒 Security

- **AppImage is read-only** - no system modification
- **Sandbox-ready** - compatible with Firejail, Flatpak, Snap
- **Code-signed** - all releases are signed

## 📄 License

REChain is licensed under Apache License 2.0
See LICENSE file for details.

## 🤝 Support

- **Issues**: https://github.com/sorydima/REChain-/issues
- **Matrix Community**: #chatting:matrix.katya.wtf
- **Email**: support@rechain.network

---

**REChain: Building the Digital Infrastructure of Autonomous Organizations** 🚀

