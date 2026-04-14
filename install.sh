#!/usr/bin/env bash
# Symlink tmux-claude-hub scripts into ~/.local/bin

set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
BIN_DIR="${HOME}/.local/bin"

mkdir -p "$BIN_DIR"

ln -sf "${REPO_DIR}/bin/tmux-claude-collect" "${BIN_DIR}/tmux-claude-collect"
ln -sf "${REPO_DIR}/bin/tmux-claude-restore" "${BIN_DIR}/tmux-claude-restore"

echo "Installed:"
echo "  ${BIN_DIR}/tmux-claude-collect -> ${REPO_DIR}/bin/tmux-claude-collect"
echo "  ${BIN_DIR}/tmux-claude-restore -> ${REPO_DIR}/bin/tmux-claude-restore"
echo ""
echo "Add to ~/.tmux.conf:"
echo "  bind G run-shell \"tmux-claude-collect\""
echo "  bind U run-shell \"tmux-claude-restore\""
