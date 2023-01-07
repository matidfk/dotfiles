#!/bin/sh
THEMES_DIR="$HOME/Themes"
theme="$(ls $THEMES_DIR | rofi -dmenu)"
output="$($HOME/Scripts/settheme.sh $theme 2>&1)"

if [ "$output" != "" ]; then
  rofi -e "$output"
fi
