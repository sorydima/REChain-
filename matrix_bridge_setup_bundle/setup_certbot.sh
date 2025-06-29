#!/bin/bash

# REChain Certbot Wild Multi-Domain Issuer (IPv4 only)

# 0. Disable IPv6 for this session (runtime only)
echo "[INFO] Disabling IPv6 (temporary)..."
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
sysctl -w net.ipv6.conf.lo.disable_ipv6=1

# 1. Check if certbot is installed
if ! command -v certbot &> /dev/null; then
  echo "❌ Certbot is not installed. Please install certbot first."
  exit 1
fi

# 2. Domains to issue certs for
DOMAINS=(
  matrix.node.marinchik.ink
  telegram.node.marinchik.ink
  signal.node.marinchik.ink
  whatsapp.node.marinchik.ink
  discord.node.marinchik.ink
  facebook.node.marinchik.ink
  instagram.node.marinchik.ink
  googlechat.node.marinchik.ink
  slack.node.marinchik.ink
  twitter.node.marinchik.ink
  bluesky.node.marinchik.ink
  gmessages.node.marinchik.ink
  email.node.marinchik.ink
  hookshot.node.marinchik.ink
  gvoice.node.marinchik.ink
  gitter.node.marinchik.ink
  xmpp.node.marinchik.ink
  mattermost.node.marinchik.ink
  mumble.node.marinchik.ink
  wechat.node.marinchik.ink
  kakaotalk.node.marinchik.ink
  qq.node.marinchik.ink
  heisenbridge.node.marinchik.ink
)

# 3. Issue certificates (IPv4-only mode by OS)
EMAIL="admin@node.marinchik.ink"

for DOMAIN in "${DOMAINS[@]}"; do
  echo "[INFO] Issuing certificate for $DOMAIN..."
  certbot certonly --standalone -d "$DOMAIN" \
    --agree-tos --no-eff-email \
    -m "$EMAIL" --non-interactive
done

echo "✅ Сертификаты выпущены и находятся в /etc/letsencrypt/live/"

# 4. Optional: re-enable IPv6 (commented out)
# sysctl -w net.ipv6.conf.all.disable_ipv6=0
# sysctl -w net.ipv6.conf.default.disable_ipv6=0
# sysctl -w net.ipv6.conf.lo.disable_ipv6=0
