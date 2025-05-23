#!/bin/bash

MENU_CMD="wofi --show dmenu --allow-images -i"
ICONS_DIR="$HOME/.config/wofi/icons/"

options=$(cat <<EOF
img:$ICONS_DIR/google-chrome.svg:text:Google
img:$ICONS_DIR/arch-linux.svg:text:Arch Wiki
img:$ICONS_DIR/chatgpt.png:text:ChatGPT
EOF
)

selection=$(echo "$options" | eval "$MENU_CMD" | sed -E 's/.*:text:(.*)/\1/')
[ -z "$selection" ] && exit 0

query=$(echo "" | wofi --show dmenu -p "Search for:")
[ -z "$query" ] && exit 0

encoded_query=$(printf %s "$query" | jq -sRr @uri)

case "$selection" in
    "Google")
        url="https://www.google.com/search?q=$encoded_query"
        ;;
    "Arch Wiki")
        url="https://wiki.archlinux.org/index.php?search=$encoded_query"
        ;;
    "ChatGPT")
        url="https://chat.openai.com/?q=$encoded_query"
        ;;
esac

xdg-open "$url" &
sleep 0.5
hyprctl dispatch focuswindow "class:^(firefox)$"

