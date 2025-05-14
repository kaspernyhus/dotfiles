#!/bin/bash

# Pick your launcher
MENU_CMD="wofi --dmenu -p 'Search where?'"
# MENU_CMD="rofi -dmenu -p 'Search where?'"

# Options
options=("Google" "Arch Wiki" "ChatGPT")

# Show menu and get selection
selection=$(printf "%s\n" "${options[@]}" | eval "$MENU_CMD")
[ -z "$selection" ] && exit 0  # User cancelled

# Prompt for search query
query=$(echo "" | eval "$MENU_CMD" -p "Search for:")
[ -z "$query" ] && exit 0  # User cancelled

# URL encode query
encoded_query=$(printf %s "$query" | jq -sRr @uri)

# Construct URL
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
    *)
        exit 1
        ;;
esac

# Open in browser
# Replace with your browser command if needed (e.g., firefox, brave)
hyprctl dispatch exec "xdg-open '$url'"
hyprctl dispatch focuswindow "class:^(firefox)$"
