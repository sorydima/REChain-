#!/bin/bash
set -e
if [ -z "$1" ]; then
  echo "Usage: $0 <backup_dir>"
  exit 1
fi
TMPDIR=$(mktemp -d)
cp $1/mappings.yaml $TMPDIR/ 2>/dev/null || true
cp $1/bridge.log $TMPDIR/ 2>/dev/null || true
if [ -f $1/dump.rdb ]; then
  cp $1/dump.rdb $TMPDIR/
fi
if [ -f $TMPDIR/mappings.yaml ]; then
  echo "Mappings file present."
  head -n 5 $TMPDIR/mappings.yaml
else
  echo "Mappings file missing!"
fi
if [ -f $TMPDIR/bridge.log ]; then
  echo "Log file present."
  head -n 5 $TMPDIR/bridge.log
else
  echo "Log file missing!"
fi
if [ -f $TMPDIR/dump.rdb ]; then
  echo "Redis dump present."
else
  echo "Redis dump missing!"
fi
echo "Backup verification complete. Temp dir: $TMPDIR" 