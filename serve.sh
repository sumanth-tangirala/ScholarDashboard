#!/bin/bash
# Launch the papers dashboard in your default browser via a local HTTP server.
# Usage: ./serve.sh
# Press Ctrl+C to stop the server when done.

DIR="$(cd "$(dirname "$0")" && pwd)"
PORT=8739

echo "Serving dashboard at http://localhost:$PORT/"
echo "Press Ctrl+C to stop."
open "http://localhost:$PORT/" 2>/dev/null || true
cd "$DIR" && python3 -m http.server "$PORT"
