#!/bin/bash

function watch_while_exists() {
  local url=$1
  local needle=$2
  # Send POST request to Discord Webhook
  result=$(curl -H "Accept-Language: ja-JP,ja;q=0.9,en;q=0.8" "$url")

  case "$result" in
    *"$needle"*)
      echo not found
      echo "$result" > result.txt
      sleep 60
      watch_while_exists "$url" "$needle"
      ;;
    *)
      echo found!
      echo "$result" > result.txt
      ;;
  esac
}
