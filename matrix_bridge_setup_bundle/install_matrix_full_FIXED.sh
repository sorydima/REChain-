#!/bin/bash
set -e

# Configuration
SERVER_NAME="your.domain.com"  # Replace with your actual domain
DB_PASSWORD="strong_password"  # Replace with your secure password
SYNAPSE_HOME="/opt/synapse"
SYNAPSE_USER="synapse"
POSTGRES_USER="synapse_user"
POSTGRES_DB="synapse"

# Install dependencies
echo "[1/8] Installing dependencies..."
apt update
apt install -y nginx postgresql postgresql-client coturn python3 python3-venv python3-dev python3-pip libpq-dev

# Configure PostgreSQL
echo "[2/8] Configuring PostgreSQL..."
sudo -u postgres psql -c "CREATE USER $POSTGRES_USER WITH PASSWORD '$DB_PASSWORD';" >/dev/null 2>&1 || true
sudo -u postgres psql -c "CREATE DATABASE $POSTGRES_DB ENCODING 'UTF8' LC_COLLATE 'C' LC_CTYPE 'C' TEMPLATE template0 OWNER $POSTGRES_USER;" >/dev/null 2>&1 || true

# Setup TURN server
echo "[3/8] Configuring TURN server..."
cat > /etc/turnserver.conf <<EOF
listening-port=3478
tls-listening-port=5349
external-ip=$(hostname -I | awk '{print $1}')
realm=$SERVER_NAME
server-name=$SERVER_NAME
lt-cred-mech
userdb=/var/lib/turn/turndb
# Uncomment for production:
#no-tcp-relay
#no-cli
EOF

# Create system user for Synapse
echo "[4/8] Creating system user..."
if ! id "$SYNAPSE_USER" &>/dev/null; then
    adduser --system --group --home "$SYNAPSE_HOME" "$SYNAPSE_USER"
fi

# Create virtual environment
echo "[5/8] Setting up virtual environment..."
mkdir -p "$SYNAPSE_HOME"
chown -R "$SYNAPSE_USER":"$SYNAPSE_USER" "$SYNAPSE_HOME"
sudo -u "$SYNAPSE_USER" python3 -m venv "$SYNAPSE_HOME/env"
sudo -u "$SYNAPSE_USER" "$SYNAPSE_HOME/env/bin/pip" install --upgrade pip
sudo -u "$SYNAPSE_USER" "$SYNAPSE_HOME/env/bin/pip" install matrix-synapse

# Generate Synapse config
echo "[6/8] Configuring Synapse..."
sudo -u "$SYNAPSE_USER" "$SYNAPSE_HOME/env/bin/python" -m synapse.app.homeserver \
    --server-name "$SERVER_NAME" \
    --config-path "$SYNAPSE_HOME/homeserver.yaml" \
    --generate-config \
    --report-stats=no

# Configure database settings
sed -i "s|#  database: sqlite3:///.*|  database: postgresql://$POSTGRES_USER:$DB_PASSWORD@localhost/$POSTGRES_DB|g" "$SYNAPSE_HOME/homeserver.yaml"
sed -i "s|#  args:|  args:|g" "$SYNAPSE_HOME/homeserver.yaml"

# Create systemd service
echo "[7/8] Creating systemd service..."
cat > /etc/systemd/system/matrix-synapse.service <<EOF
[Unit]
Description=Matrix Synapse
After=network.target postgresql.service

[Service]
User=$SYNAPSE_USER
Group=$SYNAPSE_USER
WorkingDirectory=$SYNAPSE_HOME
ExecStart=$SYNAPSE_HOME/env/bin/python -m synapse.app.homeserver -c $SYNAPSE_HOME/homeserver.yaml
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Configure Nginx
echo "[8/8] Configuring Nginx..."
cat > /etc/nginx/sites-available/$SERVER_NAME <<EOF
server {
    listen 80;
    server_name $SERVER_NAME;

    location / {
        proxy_pass http://localhost:8008;
        proxy_set_header X-Forwarded-For \$remote_addr;
    }
}
EOF

ln -s /etc/nginx/sites-available/$SERVER_NAME /etc/nginx/sites-enabled/ 2>/dev/null || true
nginx -t && systemctl reload nginx

# Enable services
systemctl daemon-reload
systemctl enable matrix-synapse coturn
systemctl start matrix-synapse coturn

echo "Installation complete!"
echo "Matrix server: $SERVER_NAME"
echo "PostgreSQL user: $POSTGRES_USER"
echo "Database: $POSTGRES_DB"
echo "Next steps:"
echo "1. Set up SSL for Nginx (e.g., Certbot)"
echo "2. Test Synapse: curl http://localhost:8008/_matrix/client/versions"