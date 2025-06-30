
#!/bin/bash
# Получить TLS-сертификат с Let's Encrypt (standalone mode)

DOMAIN=your.domain.com
EMAIL=admin@your.domain.com

certbot certonly --standalone -d $DOMAIN --agree-tos --email $EMAIL --non-interactive --preferred-challenges http
