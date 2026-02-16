#!/usr/bin/env bash
set -euo pipefail

echo "== Doctor checks =="

cmd_ok () { command -v "$1" >/dev/null 2>&1; }

ok=true

for c in git bash; do
  if ! cmd_ok "$c"; then
    echo "❌ Missing: $c"
    ok=false
  else
    echo "✅ Found: $c"
  fi
done

# Optional (only needed for certain setups)
for c in python3 pip uv node npm openclaw nanobot picoclaw docker; do
  if cmd_ok "$c"; then
    echo "✅ Optional found: $c"
  else
    echo "ℹ️ Optional not found: $c"
  fi
done

if [ "$ok" = false ]; then
  echo
  echo "Fix missing required tools and re-run."
  exit 1
fi

echo
echo "Doctor complete."
