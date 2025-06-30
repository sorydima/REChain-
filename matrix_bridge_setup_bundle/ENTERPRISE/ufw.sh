
#!/bin/bash
# Настройка UFW Firewall для Matrix + Bridges

ufw allow 22/tcp     # SSH
ufw allow 443/tcp    # HTTPS
ufw allow 8448/tcp   # Federation Synapse
ufw allow 3478,5349/tcp
ufw allow 3478,5349/udp
ufw allow 50000:51000/udp
ufw enable
