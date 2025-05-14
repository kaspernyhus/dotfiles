
#!/bin/bash

MENU_CMD="wofi --dmenu --show-icons -i -p 'Search where?'"

options=$(cat <<EOF
google-chrome Google
archlinux Arch Wiki
chatgpt ChatGPT
EOF
)

selection=$(echo "$options" | $MENU_CMD | awk '{print $1}')
[ -z "$selection" ] && exit 0

query=$(echo "" | wofi --dmenu -p "Search for:")
[ -z "$query" ] && exit 0

encoded_query=$(printf %s "$query" | jq -sRr @uri)

case "$selection" in
    google)
        url="https://www.google.dk/search?q=$encoded_query"
        ;;
    arch)
        url="https://wiki.archlinux.org/index.php?search=$encoded_query"
        ;;
    chatgpt)
        url="https://chat.openai.com/?q=$encoded_query"
        ;;
esac

xdg-open "$url" &
sleep 0.5
hyprctl dispatch focuswindow "class:^(firefox)$"
