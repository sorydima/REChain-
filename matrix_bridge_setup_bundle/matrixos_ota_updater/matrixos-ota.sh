#!/bin/bash
REPO="https://github.com/sorydima/REChain-/tree/main/matrix_bridge_setup_bundle"
DEST="/opt/matrix"

echo "[MatrixOS OTA] Checking for updates..."
cd "$DEST" && git pull origin main

echo "[MatrixOS OTA] Restarting services..."
docker-compose down && docker-compose up -d

echo "[MatrixOS OTA] Update complete."
