#!/bin/bash

echo "[INFO] Start TransIP DDNS updater..."

CONFIG_PATH=/data/options.json

LOGIN=$(jq -r '.login' "$CONFIG_PATH")
TOKEN=$(jq -r '.token' "$CONFIG_PATH")
DOMAIN=$(jq -r '.domain' "$CONFIG_PATH")
RECORD=$(jq -r '.record' "$CONFIG_PATH")
INTERVAL=$(jq -r '.interval' "$CONFIG_PATH")

echo "[INFO] Login: $LOGIN"
echo "[INFO] Domein: $DOMAIN"
echo "[INFO] Record: $RECORD"
echo "[INFO] Interval: $INTERVAL sec"

# Maak tijdelijk INI-bestand
INI_PATH="/tmp/config.ini"

cat <<EOF > "$INI_PATH"
[auth]
login = $LOGIN
api_token = $TOKEN

[default]
domain = $DOMAIN
record = $RECORD
EOF

# Loop forever
while true; do
    echo "[INFO] Updating DNS..."
    transip-ddns --config "$INI_PATH"
    echo "[INFO] Wacht $INTERVAL seconden..."
    sleep "$INTERVAL"
done
