#!/bin/sh
THEMES_DIR="$HOME/Themes"

# Quit if no argument
if [[ $1 == "" ]]; then
    # rofi -e "Please supply theme name"
    exit 0
fi

# Quit if theme doesn't exist
if [ ! -d "$THEMES_DIR/$1" ]; then
    rofi -e "Theme $1 does not exist"
    exit 0
fi

# Copy configs
cd $THEMES_DIR/$1
message=$(
  # dunst
  cp "dunstrc" "$HOME/.config/dunst/dunstrc" 2>&1
  # gtk
  sudo rm -r "/usr/share/themes/Default/gtk-2.0" 2>&1
  sudo rm -r "/usr/share/themes/Default/gtk-3.0" 2>&1
  sudo cp -r "gtk-3.0" "/usr/share/themes/Default" 2>&1
  sudo cp -r "gtk-2.0" "/usr/share/themes/Default" 2>&1
  # kitty
  cp "kitty.conf" "$HOME/.config/kitty/theme.conf" 2>&1
  # picom
  cp "picom.conf" "$HOME/.config/picom/picom.conf" 2>&1
  # polybar
  cp "polybar.ini" "$HOME/.config/polybar/config.ini" 2>&1
  # rofi
  cp "rofi.rasi" "$HOME/.config/rofi/config.rasi" 2>&1
  cp "launcher.rasi" "$HOME/.config/rofi/launcher.rasi" 2>&1
  cp "powermenu.rasi" "$HOME/.config/rofi/powermenu.rasi" 2>&1
  # conky
  cp "conky.conf" "$HOME/.config/conky/conky.conf" 2>&1
  # bash prompt
  cp "bashprompt" "$HOME/.bashprompt" 2>&1
  # bspwm
  cp "bspwmthemerc" "$HOME/.config/bspwm/themerc" 2>&1
  # wallpapers
  sudo rm /usr/share/wallpapers/* 2>&1
  sudo cp Wallpapers/* "/usr/share/wallpapers" 2>&1

   # Reload configs
  pkill kitty -USR1 2>&1
  pkill picom -USR1 2>&1
  pkill dunst -USR1 2>&1
  pkill conky -USR1 2>&1
  pkill polybar -USR1 2>&1
  $HOME/.fehbg 2>&1
  $HOME/.config/bspwm/themerc 2>&1
)

# Display error message if any
if [[ ! $message == "" ]]; then
    rofi -e "$message"
fi

