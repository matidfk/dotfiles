#!/bin/sh
THEMES_DIR="$HOME/Themes"
theme="$(ls $THEMES_DIR | wofi -dmenu)"
output="$($HOME/Scripts/settheme.sh $theme 2>&1)"

if [ "$output" != "" ]; then
  wofi -e "$output"
fi
