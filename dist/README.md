# REChain Distribution Documentation

This directory contains all configuration and scripts for building and distributing REChain packages across multiple platforms.

## Directory Structure

```
dist/
├── README.md                      # This file
├── distribution.yaml              # Main distribution configuration
├── build.sh                       # Build script
├── package # Packaging script
├── sign.sh                    .sh                        # Signing script
├── publish.sh                     # Publishing script
│
├── docker/                        # Docker configurations
│   ├── Dockerfile                # Multi-stage build
│   ├── Dockerfile.arm64          # ARM64 variant
│   └── docker-compose.yml        # Local testing
│
├── debian/                        # Debian/Ubuntu packaging
│   ├── control                   # Package metadata
│   ├── rules                     # Build rules
│   ├── postinst                  # Post-install script
│   ├── prerm                     # Pre-remove script
│   └── rechain.service           # Systemd service
│
├── redhat/                        # Red Hat/Fedora packaging
│   ├── rechain.spec              # RPM spec file
│   ├── rechain.service           # Systemd service
│   └── rechain.sysconfig         # Configuration
│
├── alpine/                        # Alpine packaging
│   ├── APKBUILD                  # Build template
│   └── rechain.pre-install       # Pre-install script
│
├── scripts/                       # Build and installation scripts
│   ├── build_common.sh           # Common build functions
│   ├── pre_install.sh            # Pre-installation checks
│   ├── post_install.sh           # Post-installation setup
│   ├── pre_remove.sh             # Pre-removal cleanup
│   ├── post_remove.sh            # Post-removal cleanup
│   ├── init_script.sh            # SysV init script
│   └── upgrade_script.sh         # Upgrade handling
│
├── templates/                     # Configuration templates
│   ├── config.yaml               # Default configuration
│   ├── logging.yaml              # Logging configuration
│   └── systemd.yaml              # Systemd template
│
└── .github/workflows/             # CI/CD workflows
    └── build.yml                 # Build and release workflow
```

## Quick Start

### Building from Source

```bash
# Clone the repository
git clone https://github.com/sorydima/REChain-.git
cd REChain-

# Navigate to dist directory
cd dist

# Run build script
./build.sh --release

# Build for specific architecture
./build.sh --release --arch arm64

# Build debug version
./build.sh --debug
```

### Creating Packages

```bash
# Build all packages
./package.sh --all

# Build specific package type
./package.sh --deb          # Debian/Ubuntu
./package.sh --rpm          # Red Hat/Fedora
./package.sh --apk          # Alpine
./package.sh --docker       # Docker image
./package.sh --snap         # Snap package
./package.sh --flatpak      # Flatpak package

# Build for multiple architectures
./package.sh --all --archs "amd64 arm64"
```

### Signing Packages

```bash
# Sign packages with GPG
./sign.sh --gpg --key "rechain@rechain.network"

# Generate checksums
./sign.sh --checksum --algorithm sha256

# Verify package integrity
./sign.sh --verify rechain_4.2.0_amd64.deb
```

### Publishing Packages

```bash
# Publish to repositories
./publish.sh --apt --repo stable
./publish.sh --yum --repo stable
./publish.sh --docker --tag latest

# Publish to multiple channels
./publish.sh --all --channel stable
./publish.sh --all --channel beta
```

## Distribution Types

### 1. Debian/Ubuntu (.deb)

**Requirements:**
- dpkg-deb
- dpkg-dev
- fakeroot

**Build:**
```bash
cd dist/debian
dpkg-buildpackage -b -us -uc
```

**Install:**
```bash
sudo dpkg -i rechain_4.2.0_amd64.deb
sudo apt-get install -f  # Fix dependencies
```

### 2. Red Hat/Fedora (.rpm)

**Requirements:**
- rpm-build
- rpmlint

**Build:**
```bash
cd dist/redhat
rpmbuild -bb rechain.spec
```

**Install:**
```bash
sudo dnf install rechain-4.2.0-1.x86_64.rpm
```

### 3. Alpine (.apk)

**Requirements:**
- abuild
- Alpine SDK

**Build:**
```bash
cd dist/alpine
abuild -r
```

**Install:**
```bash
sudo apk add --no-cache rechain-4.2.0-r0.apk
```

### 4. Docker

**Build:**
```bash
cd dist/docker
docker build -t rechain:latest .
docker build -f Dockerfile.arm64 -t rechain:arm64 .
```

**Run:**
```bash
docker run -d \
  --name rechain \
  -p 8008:8008 \
  -v rechain_data:/var/lib/rechain \
  rechain:latest
```

### 5. Snap

**Build:**
```bash
cd dist/snap
snapcraft
```

**Install:**
```bash
sudo snap install rechain_4.2.0_amd64.snap
```

### 6. Flatpak

**Build:**
```bash
flatpak-builder build com.rechain.online.json
flatpak build-export repo com.rechain.online
```

**Install:**
```bash
flatpak install rechain.flatpak
```

## Configuration

### Default Configuration

The default configuration file is located at `/etc/rechain/config.yaml` after installation.

```yaml
# Server settings
server:
  host: "0.0.0.0"
  port: 8008
  workers: 4

# Database
database:
  type: "sqlite"
  path: "/var/lib/rechain/database.db"

# Logging
logging:
  level: "info"
  format: "json"
  output: "/var/log/rechain.log"

# Security
security:
  enable_tls: true
  cert_path: "/etc/rechain/cert.pem"
  key_path: "/etc/rechain/key.pem"
```

### Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| RECHAIN_HOME | Data directory | `/var/lib/rechain` |
| RECHAIN_CONFIG | Config file path | `/etc/rechain/config.yaml` |
| RECHAIN_LOG | Log file path | `/var/log/rechain.log` |
| RECHAIN_WORKERS | Number of workers | `4` |
| RECHAIN_DEBUG | Enable debug mode | `false` |

## Service Management

### Systemd (Recommended)

```bash
# Start service
sudo systemctl start rechain

# Stop service
sudo systemctl stop rechain

# Restart service
sudo systemctl restart rechain

# Check status
sudo systemctl status rechain

# Enable at boot
sudo systemctl enable rechain
```

### SysV Init

```bash
# Start service
sudo /etc/init.d/rechain start

# Stop service
sudo /etc/init.d/rechain stop

# Restart service
sudo /etc/init.d/rechain restart

# Check status
sudo /etc/init.d/rechain status
```

### Docker

```bash
# Start container
docker start rechain

# Stop container
docker stop rechain

# Restart container
docker restart rechain

# View logs
docker logs rechain

# Follow logs
docker logs -f rechain
```

## Verification

### Check Package Integrity

```bash
# Verify GPG signature
dpkg-sig --verify rechain_4.2.0_amd64.deb

# Check checksums
sha256sum -c rechain_4.2.0_amd64.deb.sha256

# Verify RPM signature
rpm --checksig rechain-4.2.0-1.x86_64.rpm
```

### Verify Installation

```bash
# Check installed version
rechain --version

# Verify binary
rechain --verify

# Test connection
curl http://localhost:8008/_matrix/client/versions
```

## Troubleshooting

### Installation Issues

**Problem:** Missing dependencies
```bash
# For Debian/Ubuntu
sudo apt-get install -f

# For Red Hat/Fedora
sudo dnf reinstall rechain

# For Alpine
sudo apk add --no-cache --force rechain
```

**Problem:** Permission denied
```bash
# Fix ownership
sudo chown -R rechain:rechain /var/lib/rechain
sudo chown -R rechain:rechain /var/log/rechain
```

**Problem:** Port already in use
```bash
# Check what's using the port
sudo lsof -i :8008

# Kill the process
sudo kill <PID>
```

### Runtime Issues

**Problem:** Service won't start
```bash
# Check logs
journalctl -u rechain -n 100

# Check configuration
rechain --validate-config /etc/rechain/config.yaml
```

**Problem:** Database errors
```bash
# Repair database
rechain --repair-database

# Reset database
sudo rm /var/lib/rechain/database.db
sudo systemctl restart rechain
```

**Problem:** TLS certificate errors
```bash
# Regenerate certificates
sudo rechain --generate-certs

# Or use custom certificates
sudo rechain --cert /path/to/cert.pem --key /path/to/key.pem
```

## Security Considerations

### File Permissions

```bash
# Set correct permissions
sudo chmod 600 /etc/rechain/config.yaml
sudo chmod 700 /var/lib/rechain
sudo chmod 640 /var/log/rechain.log
```

### Firewall Configuration

```bash
# Allow incoming connections (ufw)
sudo ufw allow 8008/tcp

# Allow with firewall-cmd (firewalld)
sudo firewall-cmd --permanent --add-port=8008/tcp
sudo firewall-cmd --reload
```

### SELinux (RHEL/CentOS)

```bash
# Allow rechain to bind to port
sudo semanage port -a -t http_port_t -p tcp 8008

# Allow log access
sudo setsebool -P nis_enabled 1
```

## Upgrading

### Standard Upgrade

```bash
# Debian/Ubuntu
sudo apt update
sudo apt install rechain

# Red Hat/Fedora
sudo dnf update rechain

# Alpine
sudo apk add --no-cache rechain

# Docker
docker pull rechain:latest
docker restart rechain
```

### Major Version Upgrade

```bash
# Backup data
sudo cp -r /var/lib/rechain /var/lib/rechain.backup

# Stop service
sudo systemctl stop rechain

# Upgrade package
sudo apt install rechain

# Run migrations
sudo rechain --migrate

# Start service
sudo systemctl start rechain
```

## Support

For distribution-related issues:

- **GitHub Issues:** https://github.com/sorydima/REChain-/issues
- **Matrix:** #rechain:rechain.network
- **Email:** support@rechain.network

## Related Documentation

- [BUILD.md](BUILD.md) - Build instructions
- [INSTALLATION.md](INSTALLATION.md) - Installation guide
- [CONFIGURATION.md](CONFIGURATION.md) - Configuration reference
- [SECURITY.md](SECURITY.md) - Security guidelines
- [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md) - Deployment instructions

---

*Last Updated: 2025-01-09*
*Part of REChain v4.2.0 Documentation*


