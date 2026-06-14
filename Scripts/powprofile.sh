#!/usr/bin/env bash

current=$(powerprofilesctl get)

chosen=$(printf "power-saver\nbalanced\nperformance" | rofi -dmenu -p "Profile [$current]")

[ -z "$chosen" ] && exit 0

powerprofilesctl set "$chosen"
notify-send "Power Profile" "Switched to $chosen"
