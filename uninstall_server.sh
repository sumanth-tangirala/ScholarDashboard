#!/bin/bash
# Uninstall the Scholar Dashboard: stop server, clean up hosts.
# Usage: ./uninstall_server.sh

DOMAIN="scholar.local"

echo "Uninstalling Scholar Dashboard..."

# 1. Stop and remove the LaunchDaemon
DAEMON_DST="/Library/LaunchDaemons/com.scholar-dashboard.plist"
sudo launchctl unload "$DAEMON_DST" 2>/dev/null || true
sudo rm -f "$DAEMON_DST"
echo "[1/3] HTTP server stopped and removed"

# 2. Remove any old user agent version too
AGENT_DST="$HOME/Library/LaunchAgents/com.scholar-dashboard.plist"
launchctl unload "$AGENT_DST" 2>/dev/null || true
rm -f "$AGENT_DST"
echo "[2/3] Cleaned up old user agent (if any)"

# 3. Remove /etc/hosts entry
if grep -q "$DOMAIN" /etc/hosts 2>/dev/null; then
  sudo sed -i '' "/$DOMAIN/d" /etc/hosts
  echo "[3/3] Removed $DOMAIN from /etc/hosts"
else
  echo "[3/3] /etc/hosts already clean"
fi

# Clean up any leftover pfctl rules from older installs
sudo rm -f /etc/pf.anchors/com.scholar-dashboard 2>/dev/null || true
sudo launchctl unload /Library/LaunchDaemons/com.scholar-dashboard.portfwd.plist 2>/dev/null || true
sudo rm -f /Library/LaunchDaemons/com.scholar-dashboard.portfwd.plist 2>/dev/null || true
if grep -q "com.scholar-dashboard" /etc/pf.conf 2>/dev/null; then
  sudo sed -i '' '/com.scholar-dashboard/d' /etc/pf.conf
  sudo sed -i '' '/# Scholar Dashboard port forward/d' /etc/pf.conf
fi

echo ""
echo "Scholar Dashboard fully uninstalled."
