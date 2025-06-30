#!/bin/bash
set -e
BACKUP_DIR=backup_$(date +%Y%m%d_%H%M%S)
mkdir -p $BACKUP_DIR
cp mappings.yaml $BACKUP_DIR/ 2>/dev/null || true
cp bridge.log $BACKUP_DIR/ 2>/dev/null || true
if command -v redis-cli >/dev/null; then
  redis-cli save
  cp /var/lib/redis/dump.rdb $BACKUP_DIR/ 2>/dev/null || true
fi
echo "Backup complete: $BACKUP_DIR" 