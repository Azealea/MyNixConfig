#!/usr/bin/env bash

WALLPAPER_DIR="$CONFIG_DIR/Wallpaper"
STATE_FILE="/tmp/.current_wallpaper_index"
DIRECTION="$1"

mapfile -t WALLPAPERS < <(find "$WALLPAPER_DIR" | sort)

COUNT=${#WALLPAPERS[@]}
[ $COUNT -eq 0 ] && exit 1

if [ -f "$STATE_FILE" ]; then
    INDEX=$(cat "$STATE_FILE")
else
    INDEX=0
fi

if [ "$DIRECTION" = "next" ]; then
    INDEX=$(( (INDEX + 1) % COUNT ))
elif [ "$DIRECTION" = "prev" ]; then
    INDEX=$(( (INDEX - 1 + COUNT) % COUNT ))
fi

echo "$INDEX" > "$STATE_FILE"

swww img "${WALLPAPERS[$INDEX]}" --transition-type any --transition-duration 3
# types  : center , random , simple, any
