# Personal Agent Starter Kit (OpenClaw vs Nanobot vs PicoClaw)

This repo helps you:
1) understand the difference between **OpenClaw**, **Nanobot**, and **PicoClaw**, and  
2) bootstrap a **personal agent workspace** fast with templates + scripts.

> This repo does not include upstream code. You install the projects from their official repos and use this as a starter scaffold.

---

## Projects Compared

- OpenClaw: https://github.com/openclaw/openclaw  
- Nanobot: https://github.com/HKUDS/nanobot  
- PicoClaw: https://github.com/sipeed/picoclaw  

---

# 1) Purpose

## OpenClaw — full platform assistant
A local-first personal AI assistant platform with broad integrations and a richer ecosystem. Getting started uses the onboarding wizard and a gateway/daemon workflow.  
Docs: `openclaw onboard --install-daemon`, then `openclaw gateway status` and `openclaw dashboard`.  

## Nanobot — ultra-lightweight OpenClaw alternative
Nanobot focuses on being minimal and modular. Install via source, uv, or PyPI. Initialize with `nanobot onboard` and chat with `nanobot agent -m "..."`.

## PicoClaw — ultra-low footprint for edge/embedded
PicoClaw targets low-resource systems and supports a workspace + config model. Initialize with `picoclaw onboard` and run `picoclaw agent -m "Hello"`. It also supports Docker Compose.

---

# 2) How to build and run

## OpenClaw (recommended via docs)
- Run onboarding (installs daemon):  
  `openclaw onboard --install-daemon`
- Check gateway:  
  `openclaw gateway status`
- Open dashboard:  
  `openclaw dashboard`

## Nanobot
Install (source):
```bash
git clone https://github.com/HKUDS/nanobot.git
cd nanobot
pip install -e .
Or stable install:

uv tool install nanobot-ai
# OR
pip install nanobot-ai
```

### Quick start:
```bash
nanobot onboard
nanobot agent -m "Hello"
```
## PicoClaw

### Install (source):
```bash
git clone https://github.com/sipeed/picoclaw.git
cd picoclaw
make deps
make build
make install
```

### Quick start:
```bash
picoclaw onboard
picoclaw agent -m "Hello"


Docker Compose:

git clone https://github.com/sipeed/picoclaw.git
cd picoclaw
cp config/config.example.json config/config.json
docker compose --profile gateway up -d
docker compose run --rm picoclaw-agent -m "What is 2+2?"
```

# 3) Resource usage & performance (practical view)

Exact numbers vary by model/provider and enabled tools, but as a rule of thumb:

OpenClaw: higher footprint (more integrations + services)

Nanobot: medium footprint (lean, but Python runtime + tools)

PicoClaw: lowest footprint (optimized for edge / low-resource)

# 4) Who can use what
Choose OpenClaw if:

you want a full assistant platform

you need lots of channels and “product-like” experience

Choose Nanobot if:

you want a developer-friendly, lightweight assistant

you prefer Python and quick customization

Choose PicoClaw if:

you need edge/IoT/embedded-friendly deployment

you want strict workspace sandboxing patterns

# 5) Pros and cons
OpenClaw

Pros: richest features, platform feel
Cons: heavier setup/runtime

Nanobot

Pros: lightweight, clean quick start, Python ecosystem
Cons: fewer “platform” features than OpenClaw

PicoClaw

Pros: smallest footprint, Docker Compose friendly, strong workspace model
Cons: smaller ecosystem, more “builder” oriented than “product” UI

# 6) How these help (use cases)

See: examples/use-cases.md

Common patterns:

Personal productivity assistant

Team automation bot

Edge assistant (Raspberry Pi / mini-PC)

Support assistant / internal ops helper

Starter Kit: Create your personal agent workspace

This repo provides templates and setup scripts for:

IDENTITY.md (who the agent is)

AGENTS.md (behavior + style rules)

MEMORY.md (long-term notes)

HEARTBEAT.md (periodic tasks list)

# Quick start
## 0) Doctor (checks your machine)
make doctor

## 1) Scaffold a workspace

Pick one:

Nanobot

make setup_nanobot


PicoClaw

make setup_picoclaw


OpenClaw

make setup_openclaw

## 2) Run a test prompt
./scripts/run.sh nanobot "Draft a status update for my project"
./scripts/run.sh picoclaw "Summarize my TODO list and propose a plan"
./scripts/run.sh openclaw "Help me plan the week"


Note: OpenClaw runs via its own gateway/dashboard workflow. This script prints the exact commands to run.

## Where do configs live?

Nanobot typically uses: ~/.nanobot/config.json (you’ll be guided via nanobot onboard)

PicoClaw typically uses: ~/.picoclaw/config.json (you’ll be guided via picoclaw onboard)

This kit also drops sample config templates in:

templates/nanobot/config.json

templates/picoclaw/config.json

Safety reminder (production use)

If you’re building real automation, treat agent tools like code execution:

keep secrets out of repos

limit filesystem access

use least-privilege API keys

review tool actions before allowing them to run unattended