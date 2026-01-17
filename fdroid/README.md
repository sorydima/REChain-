# F-Droid Repository Configuration for REChain v4.1.10+1160

This directory contains the F-Droid repository configuration for REChain platform builds.

## Repository Types

### Main Repository (`config.py`)
- Production-ready stable releases
- Recommended for general users
- Includes security updates and bug fixes
- Version: 4.1.10+1160

### Stable Repository (`config.stable.py`)
- Enterprise-grade stable builds
- Extended testing and validation
- Long-term support included
- Version: 4.1.10+1160-stable

### Nightly Repository (`config.nightly.py`)
- Development and nightly builds
- Latest features and improvements
- For testing and development only
- ⚠️ Not recommended for production use
- Version: 4.1.10+1160-nightly

## Application Metadata

### com.rechain.online.yml
- F-Droid metadata for REChain Android application
- Includes build configuration, descriptions, and update settings
- Version: 4.1.10+1160

## Setup Instructions

1. **Install F-Droid Server:**
   ```bash
   pip install fdroidserver
   ```

2. **Initialize Repository:**
   ```bash
   fdroid init
   ```

3. **Configure Repository:**
   - Copy the appropriate config file to `config.py`
   - Update keystore passwords and keys
   - Configure mirror URLs if needed

4. **Build Applications:**
   ```bash
   fdroid build com.rechain.online
   ```

5. **Update Repository:**
   ```bash
   fdroid update
   ```

## Security Features

- **GPG Signing**: All packages are GPG signed
- **Checksum Verification**: SHA256 checksums for all files
- **Secure Keys**: Separate keystores for different build types
- **Access Control**: Configurable access permissions

## Build Configuration

### Build Requirements
- Flutter SDK 3.0+
- Android SDK 33+
- Java 11+
- Gradle 7.0+

### Build Process
1. Clone REChain repository
2. Switch to appropriate tag/version
3. Run Flutter build for Android
4. Sign and align APK
5. Update F-Droid metadata
6. Publish to repository

## Repository Management

### Adding New Builds
```bash
# Update metadata
fdroid update --create-metadata

# Build specific app
fdroid build com.rechain.online:41101160

# Update repository index
fdroid update
```

### Repository Maintenance
```bash
# Clean old builds
fdroid clean

# Check for updates
fdroid checkupdates

# Lint metadata
fdroid lint
```

## Mirror Configuration

The repository supports multiple mirrors for high availability:

- Primary: `https://fdroid.rechain.network/repo`
- Mirror 1: `https://mirror1.rechain.network/fdroid`
- Mirror 2: `https://mirror2.rechain.network/fdroid`

## Support

For support and questions:
- Email: support@rechain.network
- Documentation: https://docs.rechain.network/fdroid
- Issues: https://github.com/sorydima/REChain-/issues

## Version History

- **v4.1.10+1160** (2025-01-09): Enhanced security, performance optimizations, new features
- **v4.1.9+1159** (2024-12-15): Bug fixes and stability improvements
- **v4.1.8+1158** (2024-11-20): UI/UX enhancements and accessibility improvements

---

*Updated for REChain v4.1.10+1160 - 2025-01-09*
