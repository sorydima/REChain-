#!/bin/bash

set -e

# === BASIC VARIABLES ===
DOMAIN="node.marinchik.ink"
IP="87.228.80.4"
EMAIL="admin@${DOMAIN}"
SYNAPSE_HOME="/opt/matrix/synapse"
BRIDGES_HOME="/opt/matrix/bridges"
WEBAPP_DIR="/opt/matrix/webapp"
RECHAIN_REPO="https://github.com/sorydima/REChain-.git"
RECHAIN_WEB_URL="https://chainapp.codemagic.app"

# === UPDATE AND INSTALL CORE ===
echo "[1/8] Updating system and installing core packages..."
apt update && apt upgrade -y
apt install -y sudo curl gnupg2 git wget lsb-release software-properties-common apt-transport-https     ca-certificates build-essential python3 python3-pip python3-venv postgresql     nginx certbot python3-certbot-nginx unzip ufw coturn

# === FIX NODEJS/NPM INSTALLATION ===
echo "[1.1] Installing Node.js 20 via Nodesource..."
apt purge -y nodejs npm || true
apt autoremove -y || true
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt install -y nodejs  # DO NOT install npm separately

# === FIREWALL ===
ufw allow OpenSSH
ufw allow 80,443,8448,5349/tcp
ufw allow 5349/udp
ufw --force enable

# === SETUP POSTGRES FOR SYNAPSE ===
echo "[2/8] Configuring PostgreSQL for Synapse..."
sudo -u postgres psql <<EOF
CREATE USER synapse_user WITH PASSWORD 'synapse_pass';
CREATE DATABASE synapse ENCODING 'UTF8' LC_COLLATE='C' LC_CTYPE='C' template=template0 OWNER synapse_user;
EOF

# === INSTALL SYNAPSE ===
echo "[3/8] Installing Synapse..."
pip install --upgrade pip virtualenv
useradd -m -r -d ${SYNAPSE_HOME} -s /bin/false synapse || true
mkdir -p ${SYNAPSE_HOME}
cd ${SYNAPSE_HOME}
python3 -m venv env
source env/bin/activate
pip install matrix-synapse psycopg2
deactivate

cat <<EOF > ${SYNAPSE_HOME}/homeserver.yaml
server_name: "${DOMAIN}"
pid_file: ${SYNAPSE_HOME}/homeserver.pid
listeners:
  - port: 8448
    type: http
    tls: true
    resources:
      - names: [client, federation]
        compress: false
tls_certificate_path: ${SYNAPSE_HOME}/tls/fullchain.pem
tls_private_key_path: ${SYNAPSE_HOME}/tls/privkey.pem
database:
  name: psycopg2
  args:
    user: synapse_user
    password: synapse_pass
    database: synapse
    host: 127.0.0.1
    cp_min: 5
    cp_max: 10
log_config: ${SYNAPSE_HOME}/log.yaml
EOF

mkdir -p ${SYNAPSE_HOME}/tls
mkdir -p ${SYNAPSE_HOME}/registration

# === SSL ===
echo "[4/8] Obtaining SSL certificate..."
certbot certonly --standalone -d ${DOMAIN} --non-interactive --agree-tos -m ${EMAIL}
cp /etc/letsencrypt/live/${DOMAIN}/fullchain.pem ${SYNAPSE_HOME}/tls/
cp /etc/letsencrypt/live/${DOMAIN}/privkey.pem ${SYNAPSE_HOME}/tls/

# === TURN SERVER ===
echo "[5/8] Configuring coturn..."
cat <<EOF > /etc/turnserver.conf
listening-port=5349
tls-listening-port=5349
use-auth-secret
static-auth-secret=RECHAINTURNSECRET
realm=${DOMAIN}
cert=/etc/letsencrypt/live/${DOMAIN}/fullchain.pem
pkey=/etc/letsencrypt/live/${DOMAIN}/privkey.pem
no-multicast-peers
EOF
systemctl enable coturn
systemctl restart coturn

# === NGINX ===
echo "[6/8] Configuring Nginx reverse proxy..."
cat <<EOF > /etc/nginx/sites-available/matrix
server {
    listen 80;
    server_name ${DOMAIN};
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    server_name ${DOMAIN};

    ssl_certificate /etc/letsencrypt/live/${DOMAIN}/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/${DOMAIN}/privkey.pem;

    location /_matrix {
        proxy_pass http://localhost:8448;
        proxy_set_header Host \$host;
        proxy_set_header X-Forwarded-For \$remote_addr;
    }

    location / {
        root ${WEBAPP_DIR}/build/web;
        index index.html;
        try_files \$uri \$uri/ /index.html;
    }
}
EOF
ln -s /etc/nginx/sites-available/matrix /etc/nginx/sites-enabled/matrix
nginx -t && systemctl reload nginx

# === RECHAIN UI ===
echo "[7/8] Installing REChain web client..."
git clone ${RECHAIN_REPO} ${WEBAPP_DIR}
cd ${WEBAPP_DIR}
flutter upgrade
flutter config --enable-web
flutter build web

# === DONE ===
echo "[8/8] Base system setup complete. Synapse, coturn, REChain UI and TLS are configured."

echo "Next steps:"
echo "  - Place bridge configs and registration.yaml files into ${SYNAPSE_HOME}/registration"
echo "  - Run bridges separately or generate full bridge install script"

exit 0
