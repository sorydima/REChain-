#!/bin/bash
set -e
if [ -z "$1" ]; then
  echo "Usage: $0 <backup_dir>"
  exit 1
fi
cp $1/mappings.yaml . 2>/dev/null || true
cp $1/bridge.log . 2>/dev/null || true
if [ -f $1/dump.rdb ] && [ -d /var/lib/redis ]; then
  cp $1/dump.rdb /var/lib/redis/
  echo "Restarting Redis..."
  systemctl restart redis || true
fi
echo "Restore complete from $1" 