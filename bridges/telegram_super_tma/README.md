# Telegram Super TMA (Telegram Matrix Adapter/Agent)

A powerful bridge and bot for integrating Telegram with Matrix and the REChain ecosystem.

## Features
- Two-way message sync (Telegram <-> Matrix)
- Media/file transfer
- User and group mapping
- Command handling (bot features)
- Admin tools (moderation, analytics)
- Extensible for future integrations (AI, IPFS, etc.)

## Architecture
```
Telegram <--> [Super TMA Bot/Bridge] <--> Matrix <--> REChain
```
- **Telegram Bot**: Handles Telegram-side logic
- **Matrix Client/Bridge**: Handles Matrix-side logic
- **Bridge Logic**: Maps users, messages, media, and commands
- **REChain Integration**: Hooks for analytics, moderation, and dashboards

## Configuration
- `config.yaml`: Main config (tokens, homeserver, mappings)
- `secrets.yaml`: API keys and secrets (not in VCS)

## Getting Started
1. Install dependencies
2. Set up config and secrets
3. Run the bot/bridge

---

## Usage

### 1. Install dependencies
```sh
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### 2. Configure
- Copy `secrets.yaml.example` to `secrets.yaml` and fill in your keys.
- Edit `config.yaml` for your Telegram, Matrix, and bridge settings.

### 3. Run the bot/bridge
```sh
python bot.py
```

---

## Extending
- **Media sync:** Add media handlers in `bot.py` and `bridge.py`.
- **Commands:** Add more Telegram commands or Matrix event handlers.
- **REChain integration:** Add analytics, moderation, or dashboard hooks in the bridge logic.

---

## Dashboard API & Monitoring

Run `dashboard_api.py` alongside the bot to expose REST and WebSocket endpoints:

- `GET /health` — Bridge health
- `GET /mappings` — Current mappings
- `GET /metrics` — Message counts, errors, uptime
- `GET /ws` — WebSocket for real-time status

Example:
```sh
python dashboard_api.py
curl http://localhost:8080/metrics
```

## Troubleshooting
- Check `bridge.log` for persistent logs and errors
- Use `/bridge_status` and `/bridge_list` for health and mappings
- Use dashboard API endpoints for monitoring

## Extending & Plugins
- Add new admin commands in `bot.py`
- Add analytics or moderation hooks in `analytics.py`
- Add custom plugins by importing and calling them in message handlers

---

## Plugin Development
- Place plugins in the `plugins/` directory.
- Each plugin should define a `register(app)` function to register command handlers.
- Example:
```python
from telegram.ext import CommandHandler
async def mycmd(update, context):
    await update.message.reply_text('Hello from plugin!')
def register(app):
    app.add_handler(CommandHandler('mycmd', mycmd))
```
- Use `/reload_plugins` (admin) to reload plugins at runtime.

## Monitoring & Operations
- Use the dashboard API endpoints for health, mappings, metrics, and real-time status.
- Prometheus scraping: `GET /prometheus` for metrics.
- Persistent logs: see `bridge.log`.
- Use `/bridge_status` and `/bridge_list` for quick checks.

## Security & Hardening
- Only admin user IDs (from config) can use sensitive commands.
- Rate limiting and abuse prevention can be added via plugins.
- For multi-instance/scaling, use a shared state backend (e.g., Redis) for mappings and metrics.
- Review and test all plugins before enabling in production.

---

## RBAC (Roles & Permissions)

- Configure `roles.yaml` to map user IDs to roles and roles to allowed commands.
- Example:
```yaml
users:
  123456789: admin
  987654321: moderator
roles:
  admin:
    - bridge_add
    - bridge_remove
    - bridge_list
    - reload_plugins
    - stats
    - mod
    - echo
  moderator:
    - bridge_list
    - stats
    - mod
  user:
    - echo
```
- The bot checks permissions for each command and denies if not allowed.

---

## RBAC UI

- Run `rbac_ui.py` to launch a web interface for managing roles and permissions:
  ```sh
  python rbac_ui.py
  # Visit http://localhost:8090/rbac
  ```
- Add/update users and roles via the web UI.
- Secured with SSO in production.

---

## RBAC UI Features

- User search and role assignment
- Role creation, update, and deletion
- Audit log of all changes (see `audit.log`)
- All actions available via the web UI at `/rbac`

---

## SSO/OAuth2 Production Setup

- Configure `oauth_config.yaml` with your OAuth2 provider details.
- The RBAC UI and dashboard support OAuth2 login and callback endpoints.
- For production, use `aiohttp-oauthlib` to handle token exchange and session management.
- Secure all endpoints by checking for a valid session/token.

---

## SSO Session Management

- OAuth2 login sets a session cookie for the user.
- Use `/logout` to end the session and return to the RBAC UI.
- All RBAC UI actions require a valid session.

---

## Production Deployment

### Docker
Build and run with Docker:
```sh
docker build -t supertma .
docker run -it --rm -p 8080:8080 supertma
```

### Docker Compose
Run with Redis for scaling:
```sh
docker-compose up --build
```

### Systemd
Install as a service:
- Copy `supertma.service` to `/etc/systemd/system/`
- Set `WorkingDirectory` and `User` as needed
- `systemctl enable --now supertma`

## Scaling & Multi-Instance
- Enable `USE_REDIS=True` and configure `redis_config.yaml`
- Run multiple instances (Docker, systemd, etc.)
- Mappings and metrics are shared via Redis

---

## Kubernetes & Cloud

### Kubernetes
Apply the sample manifest:
```sh
kubectl apply -f k8s-deployment.yaml
```

### Helm
Install with Helm:
```sh
cd helm
helm install supertma .
```

### Redis HA
See `redis-ha-notes.md` for high availability setup.

## Integrating with REChain Dashboard
- Use `push_to_dashboard.py` to push metrics/status to a REChain dashboard.
- Use `dashboard_widget.html` as a sample widget to display bridge status and metrics.
- Extend as needed for your REChain ecosystem.

---

## End-to-End Encryption (E2EE)

- Matrix E2EE is supported via matrix-nio (see `e2ee_stub.py`).
- Use `SqliteMemoryStore` with a password for encrypted key storage.
- Implement full Olm/Megolm session management for production.
- Telegram does not support E2EE for bots or groups (only Secret Chats).
- See [matrix-nio E2EE docs](https://github.com/poljar/matrix-nio#end-to-end-encryption).

---

## Multi-language/i18n Support

- Add translations in `i18n/<lang>.yaml` (see `en.yaml`, `ru.yaml`).
- The bot uses translations for all replies (see `t(key, user_id)` in `bot.py`).
- Extend `get_lang(user_id)` to select language per user or chat.

---

## Automated Scaling & Self-Healing

- Use `hpa.yaml` to enable Kubernetes Horizontal Pod Autoscaler (HPA):
  ```sh
  kubectl apply -f hpa.yaml
  ```
- HPA will scale Super TMA pods based on CPU usage.
- For self-healing, use Kubernetes Deployments and health checks.
- Monitor with Prometheus and Grafana for proactive scaling and alerting.

---

## High Availability & Disaster Recovery

- See `ha_multi_region.md` for multi-region/HA deployment (Redis Sentinel/Cluster, k8s, global load balancing).
- Use `backup.sh` and `verify_backup.sh` for regular backups and integrity checks.
- Test restore with `restore.sh` in a staging environment.
- Use persistent volumes and health checks for self-healing.

---

## Plugin Marketplace/Loader UI

- Run `plugin_marketplace_ui.py` to launch a web interface for managing plugins:
  ```sh
  python plugin_marketplace_ui.py
  # Visit http://localhost:8091/plugins
  ```
- List, upload, enable, and disable plugins via the web UI.
- Secured with SSO in production.

---

## REChain Services Integration

- Use `rechain_services.py` for stubs to REChain identity and payments APIs.
- Example plugins: `identity_plugin.py` (/verify_identity), `payments_plugin.py` (/pay <amount>).
- Extend these stubs to call real REChain APIs as needed.

---

## Dashboard Widget Enhancements

- Log viewer: view last 100 lines of `bridge.log` in the widget
- Plugin reload button and management controls
- Per-user and per-room stats (stubbed, extend as needed)
- Responsive/mobile-friendly design

---

*For advanced usage, see the REChain docs and wiki.* 