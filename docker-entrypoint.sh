#!/bin/bash
set -e

# Default backend URL (can be overridden by env)
API_BASE_URL=${API_BASE_URL:-http://localhost:8282/StudentBackend}

# Path to JS config file inside WAR after extraction
CONFIG_FILE=/usr/local/tomcat/webapps/StudentFrontend/js/config.js

# Wait until Tomcat unpacks WAR (simple delay)
sleep 5

# Replace API_BASE_URL dynamically if file exists
if [ -f "$CONFIG_FILE" ]; then
    sed -i "s|API_BASE_URL: \".*\"|API_BASE_URL: \"${API_BASE_URL}\"|g" "$CONFIG_FILE"
fi

# Start Tomcat
exec "$@"

