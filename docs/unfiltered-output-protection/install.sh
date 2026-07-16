#!/usr/bin/env bash
# Install unfiltered-output-protection plugin into opencode global config.
# Blocks | head, | tail, | grep, >, >>, < in bash tool commands.
# Allows | tee, | cat, 2>&1.
set -euo pipefail

DEST="${HOME}/.config/opencode/plugins"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$DEST"
cp "$SCRIPT_DIR/server.ts" "$DEST/unfiltered-output-protection.ts"
cp "$SCRIPT_DIR/tui.ts" "$DEST/unfiltered-output-protection-tui.ts"

# Add tui.json if missing
TUI_JSON="${HOME}/.config/opencode/tui.json"
if [ ! -f "$TUI_JSON" ]; then
  cat > "$TUI_JSON" <<'EOF'
{
  "$schema": "https://opencode.ai/tui.json",
  "plugin": ["./plugins/unfiltered-output-protection-tui.ts"]
}
EOF
  echo "Created $TUI_JSON"
else
  if ! grep -q "unfiltered-output-protection" "$TUI_JSON" 2>/dev/null; then
    echo "WARNING: $TUI_JSON exists but does not reference unfiltered-output-protection."
    echo "Add ./plugins/unfiltered-output-protection-tui.ts to the plugin array manually."
  fi
fi

# Add to opencode.json if missing
CONFIG_JSON="${HOME}/.config/opencode/opencode.json"
if [ ! -f "$CONFIG_JSON" ]; then
  cat > "$CONFIG_JSON" <<'EOF'
{
  "$schema": "https://opencode.ai/config.json",
  "plugin": ["file://~/.config/opencode/plugins/unfiltered-output-protection.ts"]
}
EOF
  echo "Created $CONFIG_JSON"
else
  if ! grep -q "unfiltered-output-protection" "$CONFIG_JSON" 2>/dev/null; then
    echo "WARNING: $CONFIG_JSON exists but does not reference unfiltered-output-protection."
    echo "Add file://~/.config/opencode/plugins/unfiltered-output-protection.ts to the plugin array manually."
  fi
fi

echo "Installed. Restart opencode, then activate the plugin in the TUI plugin list."
