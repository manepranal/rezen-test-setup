#!/bin/bash
# Rezen Transaction Creator Agent
# Usage: ./run.sh                                    → interactive mode
#        ./run.sh "a1b2c3d4-..."                     → pass agent ID directly
#        ./run.sh "john.doe@example.com"             → pass email directly
#        ./run.sh "email1@x.com, email2@x.com"       → multiple agents

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

if ! command -v claude &>/dev/null; then
  echo "ERROR: 'claude' CLI not found. Install it with:"
  echo "  npm install -g @anthropic-ai/claude-code"
  exit 1
fi

if [ -n "$1" ]; then
  claude --message "Input: $1"
else
  claude
fi
