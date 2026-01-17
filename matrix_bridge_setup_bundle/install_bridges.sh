#!/bin/bash
set -e

# REChain Matrix Bridge Setup Bundle - Version 4.1.10+1160
# Installation script for Matrix bridge configurations
# Compatible with Synapse 1.100+, Docker Compose 3.8+

echo "REChain Matrix Bridge Setup Bundle v4.1.10+1160"
echo "================================================"
echo ""

mkdir -p /opt/matrix/bridges
cp -r ./bridges/* /opt/matrix/bridges/
echo "Copying registration files to Synapse..."
for file in /opt/matrix/bridges/*_registration.yaml; do
    ln -sf "$file" /opt/matrix/synapse/registration/$(basename "$file")
done
echo "Bridges setup files installed."
echo ""
echo "Bundle version: 4.1.10+1160 (Build 1160)"
