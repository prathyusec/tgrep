#!/usr/bin/env bash
# tgrep installer — installs tgrep and tgrep-tmux.
set -euo pipefail

BIN_DIR="${1:-/usr/local/bin}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ $EUID -ne 0 && "$BIN_DIR" == /usr/local/bin ]]; then
    echo "Installing to $BIN_DIR requires sudo. Re-running with sudo..."
    exec sudo "$0" "$@"
fi

mkdir -p "$BIN_DIR"
install -m 0755 "$SCRIPT_DIR/tgrep"      "$BIN_DIR/tgrep"
install -m 0755 "$SCRIPT_DIR/tgrep-tmux" "$BIN_DIR/tgrep-tmux"

echo "✓ Installed tgrep      → $BIN_DIR/tgrep"
echo "✓ Installed tgrep-tmux → $BIN_DIR/tgrep-tmux"
echo
echo "Next steps:"
echo "  1. Optional clipboard support:"
echo "       sudo apt install -y xclip"
echo "  2. tmux popup search — add to ~/.tmux.conf:"
echo "       bind -n C-f display-popup -E -w 90% -h 70% \"$BIN_DIR/tgrep-tmux\""
echo "  3. Try it:  tgrep --help"
