#!/bin/bash

function watch_while_exists() {
  local url=$1
  local needle=$2
  while true
  do
    result=$(curl -sSL -H "Accept-Language: ja-JP,ja;q=0.9,en;q=0.8" "$url")
    case "$result" in
      *"$needle"*)
        echo still exists
        sleep 60
        ;;
      *)
        echo disappeared!
        break
        ;;
    esac
  done
}
