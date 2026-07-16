#!/usr/bin/env bash
# Install unfiltered-output-protection plugin into opencode global config.
# Blocks | head, | tail, | grep, >, >>, < in bash tool commands.
# Allows | tee, | cat, 2>&1.
set -euo pipefail

DEST="${HOME}/.config/opencode/plugins"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$DEST"
rm -f "$DEST/unfiltered-output-protection.ts" "$DEST/unfiltered-output-protection-tui.ts"
ln -s "$SCRIPT_DIR/server.ts" "$DEST/unfiltered-output-protection.ts"
ln -s "$SCRIPT_DIR/tui.ts" "$DEST/unfiltered-output-protection-tui.ts"

# Activate plugin in opencode.json
CONFIG_JSON="${HOME}/.config/opencode/opencode.json"
PLUGIN_REF="unfiltered-output-protection"

if [ ! -f "$CONFIG_JSON" ]; then
  cat > "$CONFIG_JSON" <<EOF
{
  "\$schema": "https://opencode.ai/config.json",
  "plugin": ["$PLUGIN_REF"]
}
EOF
  echo "Created $CONFIG_JSON with plugin activated."
else
  if node -e "
    const fs = require('fs');
    const p = '$CONFIG_JSON';
    const cfg = JSON.parse(fs.readFileSync(p, 'utf8'));
    cfg.plugin = cfg.plugin || [];
    if (!cfg.plugin.includes('$PLUGIN_REF')) {
      cfg.plugin.push('$PLUGIN_REF');
      fs.writeFileSync(p, JSON.stringify(cfg, null, 2) + '\n');
      console.log('Activated plugin in ' + p);
    } else {
      console.log('Plugin already activated in ' + p);
    }
  " 2>/dev/null; then
    :
  else
    # Fallback: simple grep check
    if ! grep -q "$PLUGIN_REF" "$CONFIG_JSON"; then
      echo "WARNING: Could not parse $CONFIG_JSON."
      echo "Add \"$PLUGIN_REF\" to the plugin array manually."
    fi
  fi
fi

echo "Installed. Restart opencode to load the plugin."
