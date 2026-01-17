#!/bin/bash

# REChain Post-Installation Script
# Performs setup after installation

set -e

VERSION="${1:-4.2.0}"

echo "================================"
echo "REChain Post-Installation"
echo "================================"
echo ""

# Set permissions
echo "Setting permissions..."
chown root:root /etc/rechain
chmod 755 /etc/rechain

chown root:root /var/lib/rechain
chmod 755 /var/lib/rechain

chown root:root /var/log/rechain
chmod 755 /var/log/rechain

# Create rechain user if it doesn't exist
if ! id "rechain" &>/dev/null; then
    echo "Creating rechain user..."
    useradd -m -s /bin/bash -r rechain 2>/dev/null || true
fi

# Set ownership for data directories
chown -R rechain:rechain /var/lib/rechain
chown -R rechain:rechain /var/log/rechain

# Create required subdirectories
mkdir -p /var/lib/rechain/keys
mkdir -p /var/lib/rechain/uploads
mkdir -p /var/lib/rechain/backups
mkdir -p /var/lib/rechain/cache

chown -R rechain:rechain /var/lib/rechain/keys
chown -R rechain:rechain /var/lib/rechain/uploads
chown -R rechain:rechain /var/lib/rechain/backups
chown -R rechain:rechain /var/lib/rechain/cache

# Set restrictive permissions on keys directory
chmod 700 /var/lib/rechain/keys

# Enable and start service (if systemd is available)
if command -v systemctl &> /dev/null; then
    echo "Setting up systemd service..."
    systemctl daemon-reload
    
    # Enable service but don't start yet (let user do initial config)
    systemctl enable rechain.service 2>/dev/null || true
    
    echo ""
    echo "Service installed successfully!"
    echo ""
    echo "To start REChain:"
    echo "  sudo systemctl start rechain"
    echo ""
    echo "To check status:"
    echo "  sudo systemctl status rechain"
fi

# Generate default configuration if not exists
if [ ! -f /etc/rechain/config.yaml ]; then
    echo "Creating default configuration..."
    if [ -f /usr/share/rechain/config.yaml ]; then
        cp /usr/share/rechain/config.yaml /etc/rechain/config.yaml
    fi
fi

# Generate TLS certificates if enabled and not exists
if [ -f /etc/rechain/config.yaml ]; then
    if grep -q "tls:" /etc/rechain/config.yaml; then
        if grep -q "enabled: true" /etc/rechain/config.yaml; then
            if [ ! -f /etc/rechain/cert.pem ]; then
                echo "Generating self-signed TLS certificates..."
                openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
                    -keyout /etc/rechain/key.pem \
                    -out /etc/rechain/cert.pem \
                    -subj "/C=XX/ST=State/L=City/O=REChain/CN=localhost" 2>/dev/null || true
                
                chown root:root /etc/rechain/cert.pem /etc/rechain/key.pem
                chmod 600 /etc/rechain/key.pem
            fi
        fi
    fi
fi

# Generate federation signing key if not exists
if [ ! -f /etc/rechain/fed_signing_key ]; then
    echo "Generating federation signing key..."
    openssl genrsa -out /etc/rechain/fed_signing_key 2048 2>/dev/null || true
    chown root:root /etc/rechain/fed_signing_key
    chmod 600 /etc/rechain/fed_signing_key
fi

echo ""
echo "================================"
echo "Installation Complete!"
echo "================================"
echo ""
echo "REChain ${VERSION} has been installed successfully."
echo ""
echo "Next steps:"
echo "1. Edit /etc/rechain/config.yaml to configure your server"
echo "2. Start the service: sudo systemctl start rechain"
echo "3. Check logs: journalctl -u rechain -f"
echo ""
echo "Documentation: https://docs.rechain.network"
echo "Support: #rechain:rechain.network"
echo ""

exit 0
