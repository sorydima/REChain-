#!/bin/bash

# Убедитесь, что certbot установлен
if ! command -v certbot &> /dev/null; then
  echo "Certbot is not installed. Please install certbot first."
  exit 1
fi

# Основной домен Synapse
certbot certonly --standalone -d matrix.your.domain.tld --agree-tos --no-eff-email -m admin@your.domain.tld --non-interactive

# Сертификаты для всех мостов
certbot certonly --standalone -d telegram.your.domain.tld --agree-tos --no-eff-email -m admin@your.domain.tld --non-interactive
certbot certonly --standalone -d signal.your.domain.tld --agree-tos --no-eff-email -m admin@your.domain.tld --non-interactive
certbot certonly --standalone -d whatsapp.your.domain.tld --agree-tos --no-eff-email -m admin@your.domain.tld --non-interactive
certbot certonly --standalone -d discord.your.domain.tld --agree-tos --no-eff-email -m admin@your.domain.tld --non-interactive
certbot certonly --standalone -d facebook.your.domain.tld --agree-tos --no-eff-email -m admin@your.domain.tld --non-interactive
certbot certonly --standalone -d instagram.your.domain.tld --agree-tos --no-eff-email -m admin@your.domain.tld --non-interactive
certbot certonly --standalone -d googlechat.your.domain.tld --agree-tos --no-eff-email -m admin@your.domain.tld --non-interactive
certbot certonly --standalone -d slack.your.domain.tld --agree-tos --no-eff-email -m admin@your.domain.tld --non-interactive
certbot certonly --standalone -d twitter.your.domain.tld --agree-tos --no-eff-email -m admin@your.domain.tld --non-interactive
certbot certonly --standalone -d bluesky.your.domain.tld --agree-tos --no-eff-email -m admin@your.domain.tld --non-interactive
certbot certonly --standalone -d gmessages.your.domain.tld --agree-tos --no-eff-email -m admin@your.domain.tld --non-interactive
certbot certonly --standalone -d email.your.domain.tld --agree-tos --no-eff-email -m admin@your.domain.tld --non-interactive
certbot certonly --standalone -d hookshot.your.domain.tld --agree-tos --no-eff-email -m admin@your.domain.tld --non-interactive
certbot certonly --standalone -d gvoice.your.domain.tld --agree-tos --no-eff-email -m admin@your.domain.tld --non-interactive
certbot certonly --standalone -d gitter.your.domain.tld --agree-tos --no-eff-email -m admin@your.domain.tld --non-interactive
certbot certonly --standalone -d xmpp.your.domain.tld --agree-tos --no-eff-email -m admin@your.domain.tld --non-interactive
certbot certonly --standalone -d mattermost.your.domain.tld --agree-tos --no-eff-email -m admin@your.domain.tld --non-interactive
certbot certonly --standalone -d mumble.your.domain.tld --agree-tos --no-eff-email -m admin@your.domain.tld --non-interactive
certbot certonly --standalone -d wechat.your.domain.tld --agree-tos --no-eff-email -m admin@your.domain.tld --non-interactive
certbot certonly --standalone -d kakaotalk.your.domain.tld --agree-tos --no-eff-email -m admin@your.domain.tld --non-interactive
certbot certonly --standalone -d qq.your.domain.tld --agree-tos --no-eff-email -m admin@your.domain.tld --non-interactive
certbot certonly --standalone -d heisenbridge.your.domain.tld --agree-tos --no-eff-email -m admin@your.domain.tld --non-interactive

echo "✅ Сертификаты выпущены и доступны в /etc/letsencrypt/live/"