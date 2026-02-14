#!/usr/bin/env bash
# Quick script I use to set wallpaper and color-scheme.
# Nowadays I usually stick to the Dracula theme for apps
# and UI, but pywal for accents and such. More to be
# added to this script down the road
WPPR_LOG="${XDG_CACHE_HOME:-$HOME/.cache}/wppr.log"
WALLPAPER_PATH=$(find "${HOME}"../.me_local/Pictures/Wallpapers/*|shuf -n 1)
export WALLPAPER_PATH && echo "Selected image: $WALLPAPER_PATH" >> "$WPPR_LOG"
i=0
until pidof awww-daemon >> /dev/null || [ $i == 5 ]; do
   echo "Waiting for awww-daemon... $(( i * 5 )) seconds"
   sleep 5
   ((i++))
   [ $i == 5 ] && (echo "No awww-daemon process found" &>1 ; exit 1)
done
awww img --transition-fps 50 "$WALLPAPER_PATH" >> "$WPPR_LOG"|| echo "Error setting wallpaper - code:$?" &>> "$WPPR_LOG"
wal -n -s -t -e --cols16 -i "$WALLPAPER_PATH" >> "$WPPR_LOG"|| echo "Error generating colorscheme - code:$?" &>> "$WPPR_LOG"
kitten themes --reload-in=all pywal >> "$WPPR_LOG"
kitten @ --to unix:/tmp/kp set-colors ~/.config/kitty/themes/pywal.conf >> "$WPPR_LOG"
