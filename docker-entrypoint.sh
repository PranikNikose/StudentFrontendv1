#!/bin/bash
set -e

# Default backend URL (can be overridden by env)
API_BASE_URL=${API_BASE_URL:-http://localhost:8282/StudentBackend}

# Path to JS config file inside WAR after extraction
CONFIG_FILE=/usr/local/tomcat/webapps/StudentFrontend/js/config.js

echo "Waiting for Tomcat to unpack StudentFrontend.war..."
# Wait until the WAR is unpacked
while [ ! -f "$CONFIG_FILE" ]; do
  sleep 2
done

echo "Updating API_BASE_URL in config.js to: $API_BASE_URL"

# Replace inside config.js
sed -i "s|API_BASE_URL: .*|API_BASE_URL: \"$API_BASE_URL\"|g" "$CONFIG_FILE"

# Start Tomcat
exec catalina.sh run

