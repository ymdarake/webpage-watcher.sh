#!/bin/bash

function watch_while_exists() {
  local url=$1
  local needle=$2
  while true
  do
    result=$(curl -sS -H "Accept-Language: ja-JP,ja;q=0.9,en;q=0.8" "$url")
    case "$result" in
      *"$needle"*)
        echo still exists
        echo "$result" > result.txt
        sleep 60
        ;;
      *)
        echo disappeared!
        echo "$result" > result.txt
        break
        ;;
    esac
  done
}
