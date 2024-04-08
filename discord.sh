#!/bin/bash

send_discord_notification() {
  local webhook_url=$1
  local message=$2
  # Construct payload
  local payload=$(cat <<EOF
{
  "content": "$message"
}
EOF
)
  curl -H "Content-Type: application/json" -X POST -d "$payload" "$webhook_url"
}
