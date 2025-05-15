#!/bin/bash

MENU_CMD="wofi --show dmenu -i"
ICONS_DIR="$HOME/.config/wofi/icons/"

options=$(cat <<EOF
    madplan
EOF
)

selection=$(echo "$options" | eval "$MENU_CMD" | sed 's/^[[:space:]]*//')
[ -z "$selection" ] && exit 0

case "$selection" in
    "madplan")
        kitty --session /home/kaspernyhus/.config/kitty/sessions/eskemusro.session
        ;;
esac

