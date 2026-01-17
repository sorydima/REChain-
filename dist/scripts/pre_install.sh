#!/bin/bash

# REChain Pre-Installation Script
# Performs checks and setup before installation

set -e

echo "================================"
echo "REChain Pre-Installation"
echo "================================"
echo ""

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "WARNING: Not running as root. Some operations may fail."
    echo "Consider running with: sudo $0"
    echo ""
fi

# Check system requirements
echo "Checking system requirements..."

# Check OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "  OS: $PRETTY_NAME"
else
    echo "  WARNING: Unable to detect OS"
fi

# Check architecture
ARCH=$(uname -m)
echo "  Architecture: $ARCH"

# Check for required commands
MISSING_CMDS=()
for cmd in mkdir chown chmod systemctl; do
    if ! command -v "$cmd" &> /dev/null; then
        MISSING_CMDS+=("$cmd")
    fi
done

if [ ${#MISSING_CMDS[@]} -gt 0 ]; then
    echo "WARNING: Missing commands: ${MISSING_CMDS[*]}"
fi

# Check available disk space
DISK_SPACE=$(df -BG /var/lib 2>/dev/null | tail -1 | awk '{print $4}' | tr -d 'G')
if [ -z "$DISK_SPACE" ]; then
    DISK_SPACE=$(df -BG / 2>/dev/null | tail -1 | awk '{print $4}' | tr -d 'G')
fi

if [ -n "$DISK_SPACE" ] && [ "$DISK_SPACE" -lt 2 ]; then
    echo "WARNING: Low disk space: ${DISK_SPACE}GB available"
    echo "Recommended: At least 2GB free space"
else
    echo "  Disk space: OK"
fi

# Check available memory
MEMORY=$(free -m 2>/dev/null | awk '/^Mem:/{print $2}')
if [ -n "$MEMORY" ] && [ "$MEMORY" -lt 512 ]; then
    echo "WARNING: Low memory: ${MEMORY}MB available"
    echo "Recommended: At least 512MB RAM"
else
    echo "  Memory: OK (${MEMORY}MB)"
fi

# Check for conflicting services
CONFLICTS=()
if command -v systemctl &> /dev/null; then
    # Check if Synapse is installed
    if systemctl is-active --quiet synapse 2>/dev/null; then
        CONFLICTS+=("synapse (Matrix server)")
    fi
fi

if [ ${#CONFLICTS[@]} -gt 0 ]; then
    echo "WARNING: Potential conflicts detected:"
    for conflict in "${CONFLICTS[@]}"; do
        echo "  - $conflict"
    done
fi

# Check for required libraries
MISSING_LIBS=()
for lib in libssl libcrypto libsqlite3 libcurl zlib; do
    if ! ldconfig -p 2>/dev/null | grep -q "$lib"; then
        MISSING_LIBS+=("$lib")
    fi
done

if [ ${#MISSING_LIBS[@]} -gt 0 ]; then
    echo "WARNING: Missing libraries: ${MISSING_LIBS[*]}"
    echo "Install with: apt-get install ${MISSING_LIBS[*]}"
fi

# Create required directories
echo ""
echo "Creating directories..."
mkdir -p /var/lib/rechain
mkdir -p /var/log/rechain
mkdir -p /etc/rechain

# Set permissions
chown root:root /etc/rechain
chmod 755 /etc/rechain
chown -R root:root /var/lib/rechain
chmod 755 /var/lib/rechain
chown -R root:root /var/log/rechain
chmod 755 /var/log/rechain

echo "  Directories created successfully"

# Check for existing installation
if [ -f /usr/bin/rechain ]; then
    echo ""
    echo "Existing installation detected at /usr/bin/rechain"
    echo "This will be replaced during installation."
    echo "A backup will be created automatically."
fi

echo ""
echo "Pre-installation check complete!"
echo ""
echo "Ready to install REChain ${VERSION}"
echo ""

exit 0
