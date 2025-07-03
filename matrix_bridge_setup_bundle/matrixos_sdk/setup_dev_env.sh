#!/bin/bash
echo "Installing MatrixOS SDK dependencies..."
sudo apt update && sudo apt install -y docker docker-compose git python3-pip
pip3 install -r requirements.txt
