#!/bin/bash
set -eu

source .env

if [ -z "$discord_url" ]; then
    echo "discord webhook url not set."
    echo "export discord_url=<your_discord_webhook_url>"
    exit 1
fi

source discord.sh
source watch.sh

function run() {
    local url=$1
    local watch_text=$2
    local description=$3

    if [ -z "$url" ]; then
        echo "url not set."
        exit 1
    fi
    if [ -z "$watch_text" ]; then
        echo "watch_text not set."
        exit 1
    fi
    if [ -z "$description" ]; then
        echo "description not set."
        exit 1
    fi

    watch_while_exists "$url" "$watch_text"
    send_discord_notification "$discord_url" "$description:\n$url"
}

function help() {
    echo "run <url> <watch_text> <description>"
}
