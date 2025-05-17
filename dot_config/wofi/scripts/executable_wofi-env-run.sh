#!/bin/bash

MENU_CMD="wofi --show dmenu -i -p hell -p 'Select dev env'"
ACTION_DIR="$HOME/.config/wofi/actions"

# Build the options list by parsing .action files
options=$(grep -h '^name=' "$ACTION_DIR"/*.action | cut -d= -f2-)

# Let the user select
selection=$(echo "$options" | eval "$MENU_CMD" | sed 's/^[[:space:]]*//')
[ -z "$selection" ] && exit 0

# Find the corresponding .entry file
action_file=$(grep -l "name=$selection" "$ACTION_DIR"/*.action | head -n 1)
[ -z "$action_file" ] && exit 1

# Extract the action and execute it
action=$(grep '^action=' "$action_file" | cut -d= -f2-)
[ -n "$action" ] && eval "$action"

