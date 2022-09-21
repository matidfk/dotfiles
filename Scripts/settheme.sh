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

# Copy configs
cd $THEMES_DIR/$1
message=$( \
    cp "dunstrc" "$HOME/.config/dunst/dunstrc" 2>&1
    cp "gtk3.ini" "$HOME/.config/gtk-3.0/settings.ini" 2>&1
    cp "gtk4.ini" "$HOME/.config/gtk-4.0/settings.ini" 2>&1
    cp "kitty.conf" "$HOME/.config/kitty/theme.conf" 2>&1
    cp "picom.conf" "$HOME/.config/picom/picom.conf" 2>&1
    cp "polybar.ini" "$HOME/.config/polybar/config.ini" 2>&1
    cp "rofi.rasi" "$HOME/.config/rofi/config.rasi" 2>&1
    sudo cp -r "sddm" "/usr/share/sddm/themes/theme" 2>&1
)

# Display error message if any
if [[ ! $message == "" ]]; then
    rofi -e "$message"
fi

# Reload configs
pkill kitty -USR1
pkill polybar -USR1
pkill picom -USR1
pkill dunst -USR1
