#!/usr/bin/env bash
chosen=$(printf "Lock\nLogout\nReboot\nShutdown" | rofi -dmenu -p "")
case "$chosen" in
  Lock)     loginctl lock-session ;;
  Logout)   hyprctl dispatch exit ;;
  Reboot)   systemctl reboot ;;
  Shutdown) systemctl poweroff ;;
esac
