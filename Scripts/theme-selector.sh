THEMES_DIR="$HOME/Themes"
theme="$(ls $THEMES_DIR | rofi -dmenu)"
settheme.sh $theme
