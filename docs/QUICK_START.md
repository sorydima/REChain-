# REChain Quick Start Guide

Get up and running with REChain in minutes.

## Prerequisites

- **Operating System**: Linux (recommended), macOS, or Windows
- **RAM**: Minimum 2GB (4GB recommended)
- **Storage**: At least 10GB free space
- **Network**: Stable internet connection

## Installation Methods

### 1. Docker (Recommended)

```bash
# Pull the latest image
docker pull rechain/rechain:latest

# Run the container
docker run -d \
  --name rechain \
  -p 8008:8008 \
  -p 8448:8448 \
  -v rechain_data:/var/lib/rechain \
  rechain/rechain:latest
```

### 2. From Binary

```bash
# Download the latest release
wget https://rechain.network/releases/rechain-4.2.0-linux-x86_64.tar.gz

# Extract
tar -xzf rechain-4.2.0-linux-x86_64.tar.gz

# Install
sudo ./install.sh

# Start service
sudo systemctl start rechain
```

### 3. From Source

```bash
# Clone repository
git clone https://github.com/sorydima/REChain-.git
cd REChain-

# Build
cd dist && ./build.sh --release

# Install
sudo ./install.sh
```

## Initial Configuration

### Access the Admin Dashboard

1. Open your browser to `http://localhost:8008`
2. Create your admin account
3. Configure basic settings

### Basic Settings

```yaml
# /etc/rechain/config.yaml
server:
  host: "0.0.0.0"
  port: 8008

database:
  type: "sqlite"
  path: "/var/lib/rechain/database.db"

security:
  tls:
    enabled: false  # Enable for production
```

## Verify Installation

```bash
# Check service status
sudo systemctl status rechain

# Test API endpoint
curl http://localhost:8008/_matrix/client/versions

# View logs
sudo journalctl -u rechain -f
```

## Next Steps

1. [Configure your server](CONFIGURATION.md)
2. [Set up bridges](BRIDGES.md)
3. [Enable TLS/SSL](TLS_SETUP.md)
4. [Create your first room](ROOMS.md)

## Common Issues

| Problem | Solution |
|---------|----------|
| Service won't start | Check logs: `journalctl -u rechain -n 100` |
| Cannot connect | Verify port 8008 is open |
| Slow performance | Increase worker processes |

## Support

- **Documentation**: https://docs.rechain.network
- **Matrix**: #rechain:rechain.network
- **GitHub**: https://github.com/sorydima/REChain-/issues
