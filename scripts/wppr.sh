#!/usr/bin/env bash
# Quick script I use to set wallpaper and color-scheme.
# Nowadays I usually stick to the Dracula theme for apps
# and UI, but pywal for accents and such. More to be
# added to this script down the road

export WALLPAPER_PATH=~/Pictures/Wallpapers/$(ls -1 ~/Pictures/Wallpapers|shuf -n 1)
swww img --transition-fps 60 $WALLPAPER_PATH || echo "Error setting wallpaper code:$?"
wal -e -t -s --cols16 -i $WALLPAPER_PATH || echo "Error generating colorscheme code:$?"
