#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_DIR="${ROOT_DIR}/workspace/picoclaw"

mkdir -p "$OUT_DIR"
mkdir -p "$OUT_DIR/skills"

cp -f "${ROOT_DIR}/templates/common/IDENTITY.md"  "$OUT_DIR/IDENTITY.md"
cp -f "${ROOT_DIR}/templates/common/AGENTS.md"    "$OUT_DIR/AGENTS.md"
cp -f "${ROOT_DIR}/templates/common/MEMORY.md"    "$OUT_DIR/MEMORY.md"
cp -f "${ROOT_DIR}/templates/common/HEARTBEAT.md" "$OUT_DIR/HEARTBEAT.md"

cp -f "${ROOT_DIR}/templates/picoclaw/config.json" "$OUT_DIR/config.sample.json"

cat <<'TXT'

✅ PicoClaw workspace scaffolded at:
  workspace/picoclaw/

Next steps (official quick start):
  1) Install picoclaw:
     git clone https://github.com/sipeed/picoclaw.git
     cd picoclaw
     make deps && make build && make install

  2) Initialize:
     picoclaw onboard

  3) Chat:
     picoclaw agent -m "Hello"

Note:
  PicoClaw typically uses ~/.picoclaw/workspace as its active workspace.
  You can copy these templates there after onboarding if you want:
    cp -r workspace/picoclaw/* ~/.picoclaw/workspace/
TXT
