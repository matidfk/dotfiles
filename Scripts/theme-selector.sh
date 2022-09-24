#!/bin/sh
THEMES_DIR="$HOME/Themes"
theme="$(ls $THEMES_DIR | rofi -dmenu)"
$HOME/Scripts/settheme.sh $theme
