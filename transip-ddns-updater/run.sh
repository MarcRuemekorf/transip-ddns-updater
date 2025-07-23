#!/bin/bash

echo "[INFO] Starting TransIP DDNS updater"

CONFIG_PATH=/data/options.json

USERNAME=$(jq -r '.username' "$CONFIG_PATH")
TOKEN=$(jq -r '.token' "$CONFIG_PATH")
DOMAIN=$(jq -r '.domain' "$CONFIG_PATH")
RECORD=$(jq -r '.record' "$CONFIG_PATH")
INTERVAL=$(jq -r '.interval' "$CONFIG_PATH")

echo "[INFO] Username: $USERNAME"
echo "[INFO] Domain: $DOMAIN"
echo "[INFO] Record: $RECORD"
echo "[INFO] Interval: $INTERVAL sec"

INI_PATH="/tmp/config.ini"

cat <<EOF > "$INI_PATH"
[auth]
username = $USERNAME
api_token = $TOKEN

[default]
domain = $DOMAIN
record = $RECORD
EOF

# Loop forever
while true; do
    echo "[INFO] Updating DNS"
    transip_dns --config "$INI_PATH"
    echo "[INFO] Waiting $INTERVAL seconds..."
    sleep "$INTERVAL"
done
