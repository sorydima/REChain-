# Matrix Synapse + Bridges Full Setup

Этот проект настраивает полноценный Matrix-сервер Synapse с набором всех доступных мостов к популярным мессенджерам и соцсетям, используя Docker Compose, Traefik и Certbot.

## 🔧 Состав

- 📦 Synapse (основной сервер Matrix)
- 🧩 20+ мостов (Telegram, Discord, Signal, WhatsApp, Slack, XMPP и др.)
- 🔐 Traefik с Let's Encrypt сертификатами
- 📜 Certbot (автоматический выпуск SSL-сертификатов)

## ⚙️ Подготовка

1. Убедитесь, что у вас установлен Docker и Docker Compose:
   ```bash
   docker --version
   docker-compose --version
   ```

2. Склонируйте репозиторий и распакуйте содержимое архива:
   ```bash
   unzip matrix_bridge_setup_bundle.zip
   cd matrix_bridge_setup_bundle
   ```

3. Отредактируйте `docker-compose.yml` и замените `your.domain.tld` на ваш реальный домен.

4. Выпустите SSL-сертификаты с помощью скрипта:
   ```bash
   chmod +x setup_certbot.sh
   sudo ./setup_certbot.sh
   ```

## 🚀 Запуск

```bash
docker compose up -d
```

## 🌐 Доступ

- Synapse: https://matrix.your.domain.tld
- Мосты: https://<bridge>.your.domain.tld (например, https://telegram.your.domain.tld)

## 📁 Структура проекта

```
.
├── docker-compose.yml
├── setup_certbot.sh
├── traefik/
│   ├── traefik.yml
│   └── traefik_dynamic.toml
├── nginx/
│   └── nginx.conf (если не используете Traefik)
└── data/
    └── <названия мостов>/
```

## 🧩 Поддерживаемые мосты

- Telegram
- WhatsApp
- Signal
- Discord
- Facebook Messenger
- Instagram
- Google Chat
- Slack
- Twitter / X
- Bluesky
- Google Messages (SMS)
- Email (через mautrix-email)
- Webhooks (via Hookshot)
- Google Voice
- Gitter
- XMPP
- Mattermost
- Mumble
- WeChat
- KakaoTalk
- QQ
- IRC (via Heisenbridge)

## 🛠️ Поддержка

- Официальный сайт Matrix: https://matrix.org
- Документация мостов: https://docs.mau.dev