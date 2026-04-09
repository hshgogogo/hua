#!/usr/bin/env bash

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$REPO_DIR/series-storytelling-skill"
TARGET_ROOT="${1:-${OPENCLAW_SKILLS_DIR:-$HOME/.openclaw/skills}}"
TARGET_DIR="$TARGET_ROOT/series-storytelling-skill"

mkdir -p "$TARGET_ROOT"
rm -rf "$TARGET_DIR"
cp -R "$SOURCE_DIR" "$TARGET_DIR"

echo "Installed skill to: $TARGET_DIR"
echo "OpenClaw can load it from ~/.openclaw/skills on the next session."
