#!/bin/bash
# Rezen Agent — Demo Test
# Runs a full interactive demo using a sample agent ID.
# Usage: ./demo.sh

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo "========================================"
echo "  Rezen Transaction Creator — Demo Test"
echo "========================================"
echo ""

# --- Prerequisites check ---
echo "[1/3] Checking prerequisites..."

if ! command -v claude &>/dev/null; then
  echo "FAIL: 'claude' CLI not found."
  echo "      Install: npm install -g @anthropic-ai/claude-code"
  exit 1
fi
echo "  OK: claude CLI found ($(claude --version 2>/dev/null || echo 'version unknown'))"

if [ ! -f "$SCRIPT_DIR/CLAUDE.md" ]; then
  echo "FAIL: CLAUDE.md not found in $SCRIPT_DIR"
  exit 1
fi
echo "  OK: CLAUDE.md present"

if [ ! -x "$SCRIPT_DIR/run.sh" ]; then
  echo "FAIL: run.sh not found or not executable"
  exit 1
fi
echo "  OK: run.sh present and executable"

echo ""

# --- Demo inputs ---
DEMO_AGENT_ID="a1b2c3d4-1234-5678-abcd-ef1234567890"

echo "[2/3] Demo inputs:"
echo "  Agent ID : $DEMO_AGENT_ID"
echo "  (The agent will interactively ask: environment, deal type,"
echo "   transaction count, team, role, and settle/close)"
echo ""

# --- Launch agent ---
echo "[3/3] Launching agent... (type your answers when prompted)"
echo "----------------------------------------"
echo ""

./run.sh "$DEMO_AGENT_ID"
