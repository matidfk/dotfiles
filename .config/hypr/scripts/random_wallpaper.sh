#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Themes/Nord/Wallpapers/"
CURRENT_WALL=$(cat $HOME/.current_wallpaper)

# Get a random wallpaper that is not the current one
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

# Apply the selected wallpaper
hyprctl hyprpaper wallpaper ', '$WALLPAPER', '
echo $WALLPAPER > $HOME/.current_wallpaper
