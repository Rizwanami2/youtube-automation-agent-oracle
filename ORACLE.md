# YouTube Automation Agent — Oracle Cloud Free VPS

Fully adapted version for Oracle Cloud Free Tier (Ampere A1 ARM).

## Features of this version

- One-command setup script
- Systemd service (auto-start + auto-restart)
- Remote access from any device (phone, laptop, etc.)
- Nginx reverse proxy ready
- Optimized for free tier resources
- Works with AI video providers (recommended)

## Quick Start

```bash
# 1. Clone or upload this folder to your VPS
cd ~
git clone https://github.com/darkzOGx/youtube-automation-agent.git
cd youtube-automation-agent

# Or copy the files from this package

# 2. Run setup
chmod +x oracle-setup.sh
./oracle-setup.sh

# 3. Configure
cp .env.vps.example .env
nano .env
# → Add at least one AI key
# → Set a strong API_KEY
# → Keep HOST=0.0.0.0

# 4. Install as service
sudo cp youtube-agent.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now youtube-agent

# 5. Check status
sudo systemctl status youtube-agent
```

## Open Firewall (Oracle Console)

1. Go to your Instance → Subnet → Security List
2. Add Ingress Rule:
   - Source CIDR: `0.0.0.0/0`
   - Protocol: TCP
   - Destination Port: `3456`

## Access from other devices

Open in any browser:
```
http://YOUR_ORACLE_PUBLIC_IP:3456
```

Enter the `API_KEY` you set in `.env`.

## Optional: Nginx + Free HTTPS

```bash
sudo cp nginx-youtube-agent.conf /etc/nginx/sites-available/youtube-agent
sudo ln -s /etc/nginx/sites-available/youtube-agent /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx

# Free SSL (if you have a domain)
sudo certbot --nginx -d yourdomain.com
```

## Recommended for Free Tier

| Setting | Value | Reason |
|---------|-------|--------|
| Video | Use Kling / Wan / Seedance | Low local resource usage |
| Slideshow | Possible but heavy | Chromium uses a lot of RAM |
| HOST | `0.0.0.0` | Access from phone/laptop |
| API_KEY | Strong secret | Protect dashboard |

## Useful Commands

```bash
# View logs
sudo journalctl -u youtube-agent -f

# Restart
sudo systemctl restart youtube-agent

# Stop
sudo systemctl stop youtube-agent
```

## Notes

- Oracle Free Tier is ARM (Ampere). Node.js and most packages work fine.
- Playwright/Chromium can be installed but is memory-heavy. Prefer cloud AI video providers.
- The service automatically restarts if it crashes.
