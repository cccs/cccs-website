#!/bin/bash

ACCOUNT_ID="4628"
INSTANCE="chaos.social"

# Basisverzeichnis des Projekts ermitteln (ein Verzeichnis über /scripts)
PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DATA_DIR="$PROJECT_ROOT/content/_data"
FILE="$DATA_DIR/mastodon.json"
UPDATE_FILE="$PROJECT_ROOT/scripts/update.json"
TEMP_FILE="$PROJECT_ROOT/scripts/temp.json"

# Sicherstellen, dass das Zielverzeichnis existiert
mkdir -p "$DATA_DIR"

if [ -f "$FILE" ] ; then
  LASTID=$(jq -r '.[0].id' "$FILE")
  
  curl -s "https://${INSTANCE}/api/v1/accounts/${ACCOUNT_ID}/statuses?limit=40&since_id=${LASTID}" > "$UPDATE_FILE"
  
  if [ "$(jq 'length' "$UPDATE_FILE")" -gt "0" ]; then
    jq -s '.[0] + .[1]' "$UPDATE_FILE" "$FILE" > "$TEMP_FILE" && mv "$TEMP_FILE" "$FILE"
  fi
  rm -f "$UPDATE_FILE"
else
  curl -s "https://${INSTANCE}/api/v1/accounts/${ACCOUNT_ID}/statuses?limit=40" > "$FILE"
fi
