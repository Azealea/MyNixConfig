#!/usr/bin/env bash
set -euo pipefail

WALLPAPER_DIR="$CONFIG_DIR/Wallpaper"
CURRENT_LINK="/tmp/current-wallpaper"
DIRECTION="${1:-next}"

mapfile -t WALLPAPERS < <(find "$WALLPAPER_DIR" -type f | sort)

COUNT=${#WALLPAPERS[@]}
[ "$COUNT" -eq 0 ] && exit 1

if [ -L "$CURRENT_LINK" ]; then
    CURRENT_WALLPAPER="$(readlink -f "$CURRENT_LINK")"
else
    CURRENT_WALLPAPER=""
fi

INDEX=0
for i in "${!WALLPAPERS[@]}"; do
    if [ "${WALLPAPERS[$i]}" = "$CURRENT_WALLPAPER" ]; then
        INDEX="$i"
        break
    fi
done

if [ "$DIRECTION" = "next" ]; then
    INDEX=$(( (INDEX + 1) % COUNT ))
elif [ "$DIRECTION" = "prev" ]; then
    INDEX=$(( (INDEX - 1 + COUNT) % COUNT ))
fi

NEW_WALLPAPER="${WALLPAPERS[$INDEX]}"

swww img "$NEW_WALLPAPER" --transition-type any --transition-duration 3

ln -sf "$NEW_WALLPAPER" "$CURRENT_LINK"

magick "$NEW_WALLPAPER" -resize 500x500^ -gravity center -extent 500x500 -strip "/tmp/rofi-wallpaper.jpg"
