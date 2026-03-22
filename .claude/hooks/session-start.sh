#!/bin/bash
set -euo pipefail

# Only run in Claude Code remote environments
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$(cd "$(dirname "$0")/../.." && pwd)}"

# Install Node.js dependencies for the TypeScript plugin
cd "$PROJECT_DIR/nemoclaw"
npm install

# Install Python dependencies for the blueprint tooling
cd "$PROJECT_DIR/nemoclaw-blueprint"
uv sync

# Install root-level Python dependencies (docs tooling)
cd "$PROJECT_DIR"
uv sync
