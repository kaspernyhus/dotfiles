#!/bin/bash


SCRIPT_DIR="$HOME/.config/hypr/scripts/hyprlock/"

# Update temp .conf with current wallpapaer path
"$SCRIPT_DIR/update_conf.sh"

# Set paths
default_conf="$HOME/.config/hypr/hyprlock.conf"
temp_conf="/tmp/hyprlock.conf"

# Check if the temporary config file exists
if [[ -f "$temp_conf" ]]; then
    config_file="$temp_conf"
else
    config_file="$default_conf"
fi

# Run hyprlock with the chosen config
hyprlock -q -c "$config_file"

