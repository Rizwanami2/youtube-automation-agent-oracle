# YouTube Automation Agent — Oracle Free VPS Edition

This is the Oracle Cloud Free Tier adapted version of the YouTube Automation Agent.

**Original project:** https://github.com/darkzOGx/youtube-automation-agent

## Quick Start on Oracle VPS

See **[ORACLE.md](ORACLE.md)** for full instructions.

```bash
git clone https://github.com/Rizwanami2/youtube-automation-agent-oracle.git
cd youtube-automation-agent-oracle
chmod +x oracle-setup.sh
./oracle-setup.sh
cp .env.vps.example .env
nano .env
sudo systemctl enable --now youtube-agent
```

Then open `http://YOUR_PUBLIC_IP:3456` from any device.
