#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_DIR="${ROOT_DIR}/workspace/nanobot"

mkdir -p "$OUT_DIR"
mkdir -p "$OUT_DIR/skills"

# Common templates
cp -f "${ROOT_DIR}/templates/common/IDENTITY.md"  "$OUT_DIR/IDENTITY.md"
cp -f "${ROOT_DIR}/templates/common/AGENTS.md"    "$OUT_DIR/AGENTS.md"
cp -f "${ROOT_DIR}/templates/common/MEMORY.md"    "$OUT_DIR/MEMORY.md"
cp -f "${ROOT_DIR}/templates/common/HEARTBEAT.md" "$OUT_DIR/HEARTBEAT.md"

# Sample config template (NOT automatically used by nanobot; it's for reference)
cp -f "${ROOT_DIR}/templates/nanobot/config.json" "$OUT_DIR/config.sample.json"

cat <<'TXT'

✅ Nanobot workspace scaffolded at:
  workspace/nanobot/

Next steps (official quick start):
  1) Install nanobot:
     - From source: git clone https://github.com/HKUDS/nanobot.git && pip install -e .
     - Or stable: uv tool install nanobot-ai   OR   pip install nanobot-ai

  2) Initialize:
     nanobot onboard

  3) Chat:
     nanobot agent -m "Hello"

Tip:
  Keep your agent "personality" in workspace/nanobot/IDENTITY.md + AGENTS.md.
TXT
