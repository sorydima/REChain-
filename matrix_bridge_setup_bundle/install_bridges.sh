#!/bin/bash
set -e
mkdir -p /opt/matrix/bridges
cp -r ./bridges/* /opt/matrix/bridges/
echo "Copying registration files to Synapse..."
for file in /opt/matrix/bridges/*_registration.yaml; do
    ln -sf "$file" /opt/matrix/synapse/registration/$(basename "$file")
done
echo "Bridges setup files installed."