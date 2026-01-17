ocs_for_landing/GETTING_STARTED.md</path>
<parameter name="content"># REChain Getting Started Guide

Get started with REChain in minutes.

## Choose Your Path

| Goal | Best Option |
|------|-------------|
| Try quickly | Use [rechain.online](https://rechain.online) |
| Personal server | Docker installation |
| Team deployment | Binary installation |
| Development | Source installation |

## Option 1: Use REChain Online (Fastest)

1. Visit [rechain.online](https://rechain.online)
2. Create a free account
3. Start messaging immediately

**Features included:**
- Unlimited messages
- 1GB file storage
- Access to all bridges
- Mobile and web apps

## Option 2: Docker Installation (Recommended)

### Prerequisites

- Docker installed
- Docker Compose installed
- At least 2GB RAM

### Steps

```bash
# 1. Create project directory
mkdir rechain
cd rechain

# 2. Create docker-compose.yml
cat > docker-compose.yml << 'EOF'
version: '3.8'
services:
  rechain:
    image: rechain/rechain:latest
    container_name: rechain
    restart: unless-stopped
    ports:
      - "8008:8008"
      - "8448:8448"
    volumes:
      - ./config:/etc/rechain
      - rechain_data:/var/lib/rechain
      - rechain_logs:/var/log/rechain
    environment:
      - SYNAPSE_SERVER_NAME=localhost
      - SYNAPSE_REPORT_STATS=no

volumes:
  rechain_data:
  rechain_logs:
EOF

# 3. Create configuration
mkdir config
cat > config/homeserver.yaml << 'EOF'
server:
  host: "0.0.0.0"
  port: 8008

database:
  type: "sqlite"
  path: "/var/lib/rechain/database.db"

logging:
  level: "info"
EOF

# 4. Start the server
docker compose up -d

# 5. Verify it's running
curl http://localhost:8008/_matrix/client/versions
```

### Access Your Server

- **Client API**: http://localhost:8008
- **Web Client**: Use [Element](https://element.io) with your server URL

## Option 3: Binary Installation

### Prerequisites

- Linux server (Ubuntu 20.04+ recommended)
- At least 2GB RAM
- 20GB storage

### Steps

```bash
# 1. Download the latest release
wget https://rechain.network/releases/rechain-4.2.0-linux-x86_64.tar.gz

# 2. Extract
tar -xzf rechain-4.2.0-linux-x86_64.tar.gz
cd rechain-4.2.0

# 3. Install
sudo ./install.sh

# 4. Configure
sudo nano /etc/rechain/homeserver.yaml

# 5. Start service
sudo systemctl start rechain
sudo systemctl enable rechain

# 6. Check status
sudo systemctl status rechain
```

### Configuration

Edit `/etc/rechain/homeserver.yaml`:

```yaml
server:
  host: "0.0.0.0"
  port: 8008
  workers: 4

database:
  type: "sqlite"
  path: "/var/lib/rechain/database.db"

redis:
  host: "localhost"
  port: 6379

logging:
  level: "info"
  format: "json"

metrics:
  enabled: true
  port: 9090
```

## Option 4: Source Installation (For Developers)

### Prerequisites

- Git
- Dart SDK 3.0+
- PostgreSQL 14+ (optional, SQLite works too)

### Steps

```bash
# 1. Install Dart
wget https://storage.googleapis.com/dart-archive/channels/stable/release/3.0.0/linux/packages/dart-sdk_3.0.0-299.2.beta_amd64.deb
sudo dpkg -i dart-sdk_3.0.0-299.2.beta_amd64.deb

# 2. Clone repository
git clone https://github.com/sorydima/REChain-.git
cd REChain-

# 3. Install dependencies
cd lib
dart pub get

# 4. Build
cd ..
cd dist
./build.sh --release

# 5. Run tests
cd ..
dart test

# 6. Start development server
dart run
```

## Your First Steps

### 1. Create Your Account

If using Docker or binary:
1. Open your web browser
2. Go to http://your-server:8008
3. Click "Register"
4. Fill in your details
5. Verify your email (if configured)

### 2. Download Apps

| Platform | Download |
|----------|----------|
| Android | Google Play / F-Droid |
| iOS | App Store |
| Desktop | [Download](link) |
| Web | [app.rechain.online](https://app.rechain.online) |

### 3. Connect Your Devices

1. Install the app on your device
2. Enter your server URL:
   - For online: `https://rechain.online`
   - For self-hosted: `https://your-domain.com`
3. Sign in with your credentials

### 4. Create Your First Room

1. Click the "+" button or "Create Room"
2. Enter a room name
3. Set visibility (private/public)
4. Invite contacts
5. Start chatting!

### 5. Explore Features

**Try these features:**

- Send your first message
- Share a file or image
- Start a voice/video call
- React to a message with emoji
- Create a thread reply
- Edit a message
- Pin an important message

## Common Tasks

### Invite Friends

```bash
# Generate invite link
curl -X POST http://localhost:8008/_matrix/client/v3/rooms/!roomid:domain/invite \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -d '{"user_id": "@friend:domain"}'
```

### Set Up Bridges

**Telegram Bridge:**

```yaml
# /etc/rechain/bridges/telegram.yaml
bridge:
  telegram:
    bot:
      token: "YOUR_BOT_TOKEN"
```

### Configure Encryption

1. Go to Settings > Security
2. Click "Enable Encryption"
3. Verify your devices
4. Set up key backup

### Change Your Display Name

1. Go to Settings > Profile
2. Click on your display name
3. Enter new name
4. Save changes

## Troubleshooting

### Can't Connect?

```bash
# Check if server is running
sudo systemctl status rechain

# Check ports
netstat -tulpn | grep 8008

# View logs
sudo journalctl -u rechain -f
```

### Login Failed?

- Check your credentials
- Verify server URL is correct
- Check if server is running
- Clear app cache

### Messages Not Syncing?

- Check internet connection
- Force sync by pulling down
- Check server status
- Try logging out and back in

### Need More Help?

- [Documentation](https://docs.rechain.network)
- [FAQ](FAQ.md)
- [Support](SUPPORT.md)
- [Matrix Community](https://matrix.to/#/#rechain:rechain.network)

## Next Steps

### Personal Use

- [ ] Set up profile
- [ ] Enable encryption
- [ ] Configure notifications
- [ ] Connect bridges

### Team Use

- [ ] Create team rooms
- [ ] Set up integrations
- [ ] Configure SSO
- [ ] Set up moderation

### Enterprise Use

- [ ] Deploy production server
- [ ] Configure LDAP/SSO
- [ ] Set up compliance tools
- [ ] Configure backup

## Security Best Practices

1. **Enable encryption** for private conversations
2. **Verify devices** to prevent interception
3. **Use strong passwords** or SSO
4. **Keep software updated**
5. **Regular backups**
6. **Monitor logs** for suspicious activity

---

**Ready for more?** Check out our [Features](FEATURES.md) or [Security](SECURITY.md) documentation.
