#!/bin/bash

wallpaper_path=$(hyprctl hyprpaper listloaded)
orig_conf="$HOME/.config/hypr/hyprlock.conf"
temp_conf="/tmp/hyprlock.conf"

# Replace the path line
sed -E "s|^\s*path = .*|    path = $wallpaper_path|" "$orig_conf" > "$temp_conf"

