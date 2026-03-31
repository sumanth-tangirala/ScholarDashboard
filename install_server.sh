#!/bin/bash
# Install the Scholar Dashboard as a background service accessible at http://scholar.local
#
# What this does:
#   1. Installs a LaunchDaemon that runs a Python HTTP server on port 80 (bound to localhost only)
#   2. Adds "scholar.local" to /etc/hosts
#
# Requires sudo (port 80 + /etc/hosts).
# Usage: ./install_server.sh

set -e

DIR="$(cd "$(dirname "$0")" && pwd)"
DOMAIN="scholar.local"
PLIST_NAME="com.scholar-dashboard.plist"
PLIST_SRC="$DIR/$PLIST_NAME"
DAEMON_DST="/Library/LaunchDaemons/$PLIST_NAME"
AGENT_DST="$HOME/Library/LaunchAgents/$PLIST_NAME"

echo "Installing Scholar Dashboard..."
echo ""

# --- Clean up any old user-agent version ---
launchctl unload "$AGENT_DST" 2>/dev/null || true
rm -f "$AGENT_DST"

# --- 1. LaunchDaemon (runs as root to bind port 80) ---
echo "Requires sudo for port 80 and /etc/hosts..."
sudo launchctl unload "$DAEMON_DST" 2>/dev/null || true
sudo cp "$PLIST_SRC" "$DAEMON_DST"
sudo chown root:wheel "$DAEMON_DST"
sudo chmod 644 "$DAEMON_DST"
sudo launchctl load "$DAEMON_DST"
echo "[1/2] HTTP server installed (port 80, localhost only)"

# --- 2. /etc/hosts entry ---
if grep -q "$DOMAIN" /etc/hosts 2>/dev/null; then
  echo "[2/2] /etc/hosts already has $DOMAIN"
else
  echo "127.0.0.1  $DOMAIN" | sudo tee -a /etc/hosts > /dev/null
  echo "[2/2] Added $DOMAIN to /etc/hosts"
fi

# --- Clean up any old pfctl rules from previous install ---
sudo rm -f /etc/pf.anchors/com.scholar-dashboard 2>/dev/null || true
sudo launchctl unload /Library/LaunchDaemons/com.scholar-dashboard.portfwd.plist 2>/dev/null || true
sudo rm -f /Library/LaunchDaemons/com.scholar-dashboard.portfwd.plist 2>/dev/null || true
if grep -q "com.scholar-dashboard" /etc/pf.conf 2>/dev/null; then
  sudo sed -i '' '/com.scholar-dashboard/d' /etc/pf.conf
  sudo sed -i '' '/# Scholar Dashboard port forward/d' /etc/pf.conf
fi

echo ""
echo "Done! Your dashboard is live at:"
echo ""
echo "  http://$DOMAIN"
echo ""
echo "Bookmark that URL. It will work after every reboot."
echo "To uninstall: ./uninstall_server.sh"
