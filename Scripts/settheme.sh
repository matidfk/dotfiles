THEMES_DIR="$HOME/Themes"

# Quit if no argument
if [[ $1 == "" ]]; then
    echo "Please supply theme name"
    exit 0
fi

# Quit if theme doesn't exist
if [ ! -d "$THEMES_DIR/$1" ]; then
    echo "Theme $1 does not exist"
    exit 0
fi

cd $THEMES_DIR/$1

cp "dunstrc" "$HOME/.config/dunst/dunstrc"
cp "gtk3.ini" "$HOME/.config/gtk-3.0/settings.ini"
cp "gtk4.ini" "$HOME/.config/gtk-4.0/settings.ini"
cp "kitty.conf" "$HOME/.config/kitty/theme.conf"
cp "picom.conf" "$HOME/.config/picom/picom.conf"
cp "polybar.ini" "$HOME/.config/polybar/config.ini"
cp "rofi.rasi" "$HOME/.config/rofi/config.rasi"

pkill kitty -USR1
pkill polybar -USR1
pkill picom -USR1
pkill dunst -USR1
