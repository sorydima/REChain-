
# Matrix Bridges Final Installer

**Version:** 4.1.10+1160  
**Build:** 1160  
**Release Date:** 2025

Этот архив содержит:
- Установочный скрипт
- Конфиги мостов (configs/)
- Registration-файлы для Synapse (registrations/)

## Совместимость

- **Synapse Version:** 1.100+
- **Docker Compose:** 3.8+
- **REChain Version:** 4.1.10+1160

## Использование

1. Распакуйте архив:
```bash
unzip matrix_bridges_final_package.zip
cd matrix_bridges_final_package
```

2. Установите мосты вручную или используйте свой install_bridges.sh

3. Registration-файлы подключаются к Synapse:
```bash
cp registrations/*.yaml /opt/matrix/synapse/registration/
```

## Включенные мосты

- Telegram (mautrix/telegram)
- Signal (mautrix/signal)
- WhatsApp (mautrix/whatsapp)
- Discord (mautrix/discord)
- Facebook (mautrix/facebook)
- Instagram (mautrix/instagram)
- GoogleChat (mautrix/googlechat)
- Slack (mautrix/slack)
- Twitter (mautrix/twitter)
- BlueSky (mautrix/bluesky)
- Google Messages (mautrix/gmessages)
- Email (mautrix/email)
- Hookshot (mautrix/hookshot)
- Google Voice (mautrix/gvoice)
- Gitter (mautrix/gitter)
- XMPP (mautrix/xmpp)
- Mattermost (mautrix/mattermost)
- Mumble (mautrix/mumble)
- WeChat (mautrix/wechat)
- KakaoTalk (mautrix/kakaotalk)
- QQ (mautrix/qq)
- Heisenbridge (mautrix/heisenbridge)

