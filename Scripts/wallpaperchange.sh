#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/nixMine/Wallpaper"
STATE_FILE="/tmp/.current_wallpaper_index"
DIRECTION="$1"

# Get all image files sorted
mapfile -t WALLPAPERS < <(find "$WALLPAPER_DIR" | sort)

COUNT=${#WALLPAPERS[@]}
[ $COUNT -eq 0 ] && exit 1

# Load index or start at 0
if [ -f "$STATE_FILE" ]; then
    INDEX=$(cat "$STATE_FILE")
else
    INDEX=0
fi

# Update index
if [ "$DIRECTION" = "next" ]; then
    INDEX=$(( (INDEX + 1) % COUNT ))
elif [ "$DIRECTION" = "prev" ]; then
    INDEX=$(( (INDEX - 1 + COUNT) % COUNT ))
fi

# Save new index
echo "$INDEX" > "$STATE_FILE"

# Set wallpaper using swww
swww img "${WALLPAPERS[$INDEX]}" --transition-type any --transition-duration 1
