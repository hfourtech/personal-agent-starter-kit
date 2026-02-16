#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-}"
PROMPT="${2:-}"

if [[ -z "$TARGET" || -z "$PROMPT" ]]; then
  echo "Usage: ./scripts/run.sh {nanobot|picoclaw|openclaw} \"your prompt\""
  exit 1
fi

case "$TARGET" in
  nanobot)
    if command -v nanobot >/dev/null 2>&1; then
      nanobot agent -m "$PROMPT"
    else
      echo "nanobot not found. Install it, then run:"
      echo "  nanobot onboard"
      echo "  nanobot agent -m \"$PROMPT\""
      exit 2
    fi
    ;;
  picoclaw)
    if command -v picoclaw >/dev/null 2>&1; then
      picoclaw agent -m "$PROMPT"
    else
      echo "picoclaw not found. Install it, then run:"
      echo "  picoclaw onboard"
      echo "  picoclaw agent -m \"$PROMPT\""
      exit 2
    fi
    ;;
  openclaw)
    echo "OpenClaw is typically run via its onboarding + gateway/dashboard:"
    echo "  openclaw onboard --install-daemon"
    echo "  openclaw gateway status"
    echo "  openclaw dashboard"
    echo
    echo "Prompt you wanted to run:"
    echo "  $PROMPT"
    ;;
  *)
    echo "Unknown target: $TARGET (use nanobot|picoclaw|openclaw)"
    exit 1
    ;;
esac
