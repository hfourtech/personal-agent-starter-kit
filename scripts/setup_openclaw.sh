#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_DIR="${ROOT_DIR}/workspace/openclaw"

mkdir -p "$OUT_DIR"

cp -f "${ROOT_DIR}/templates/common/IDENTITY.md"  "$OUT_DIR/IDENTITY.md"
cp -f "${ROOT_DIR}/templates/common/AGENTS.md"    "$OUT_DIR/AGENTS.md"
cp -f "${ROOT_DIR}/templates/common/MEMORY.md"    "$OUT_DIR/MEMORY.md"
cp -f "${ROOT_DIR}/templates/common/HEARTBEAT.md" "$OUT_DIR/HEARTBEAT.md"

cat <<'TXT'

✅ OpenClaw workspace notes scaffolded at:
  workspace/openclaw/

OpenClaw quick start (official docs):
  openclaw onboard --install-daemon
  openclaw gateway status
  openclaw dashboard

Use the files in workspace/openclaw/ as your agent spec:
  - IDENTITY.md / AGENTS.md: behavior + tone
  - MEMORY.md: things agent should remember
  - HEARTBEAT.md: periodic tasks ideas
TXT
