#!/bin/bash
# YouTube Automation Agent — Oracle Cloud Free VPS Setup
# Tested on Ubuntu 22.04 / 24.04 (ARM Ampere A1)

set -e

echo "=============================================="
echo " YouTube Automation Agent — Oracle Free VPS"
echo "=============================================="

# Update system
sudo apt update && sudo apt upgrade -y

# Install Node.js 20
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

# Install system dependencies
sudo apt install -y ffmpeg python3 build-essential nginx certbot python3-certbot-nginx

# Install project dependencies
echo "Installing Node packages..."
npm install

# Optional: skip heavy Playwright if you only want AI video providers
# npm install --omit=optional

echo ""
echo "=============================================="
echo " Setup finished!"
echo "=============================================="
echo ""
echo "Next steps:"
echo "  1. cp .env.example .env"
echo "  2. nano .env          # add your API keys + HOST=0.0.0.0 + API_KEY"
echo "  3. sudo cp youtube-agent.service /etc/systemd/system/"
echo "  4. sudo systemctl daemon-reload"
echo "  5. sudo systemctl enable --now youtube-agent"
echo ""
echo "Dashboard: http://YOUR_PUBLIC_IP:3456"
echo "Remember to open port 3456 in Oracle Security List"
