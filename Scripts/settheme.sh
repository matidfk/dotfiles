#!/bin/sh
themes_dir="$HOME/Themes"
config_dir="$HOME/.config"

theme=$1

# Quit if no argument
if [[ $theme == "" ]]; then
    # rofi -e "Please supply theme name"
    exit 1
fi

# Quit if theme doesn't exist
if [ ! -d "$themes_dir/$theme" ]; then
    >&2 echo "Theme $theme does not exist"
    exit 1
fi

files=(
  "dunstrc        $config_dir/dunst/dunstrc"
  "kitty.conf     $config_dir/kitty/theme.conf"
  "picom.conf     $config_dir/picom/picom.conf"
  "polybar.ini    $config_dir/polybar/config.ini"
  "rofi.rasi      $config_dir/rofi/config.rasi"
  "launcher.rasi  $config_dir/rofi/launcher.rasi"
  "powermenu.rasi $config_dir/rofi/powermenu.rasi"
  "conky.conf     $config_dir/conky/conky.conf"
  "bashprompt     $HOME/.bashprompt"
  "bspwmthemerc   $config_dir/bspwm/themerc"
)

cd $themes_dir/$theme

# check files exist
for f in "${files[@]}"; do
  file=($f)
  source_file="${file[0]}"
  dest_file="${file[1]}"
  if ! [ -f "$source_file" ]; then
    >&2 echo "source file $source_file does not exist!"
    exit 1
  fi
done

# create symbolic links
message=""

for f in "${files[@]}"; do
  file=($f)
  source_file="${file[0]}"
  dest_file="${file[1]}"
  error=$(ln -sf "$themes_dir/$theme/$source_file" "$dest_file" 2>&1)
  if [ -z "$error" ]; then
    message+=$'\n'"$error"
  fi
done

# other stuff
message+=$(
  sudo rm -r "/usr/share/themes/Default/gtk-2.0" 2>&1
  sudo rm -r "/usr/share/themes/Default/gtk-3.0" 2>&1
  sudo cp -r "gtk-3.0" "/usr/share/themes/Default" 2>&1
  sudo cp -r "gtk-2.0" "/usr/share/themes/Default" 2>&1
  # wallpapers
  sudo rm -r /usr/share/wallpapers/* 2>&1
  sudo cp Wallpapers/* "/usr/share/wallpapers" 2>&1

   # Reload configs
  pkill kitty -USR1 2>&1
  pkill dunst -USR1 2>&1
  pkill conky -USR1 2>&1
  pkill polybar -USR1 2>&1
  pkill picom -USR1 2>&1
  $HOME/.fehbg 2>&1
  $HOME/.config/bspwm/themerc 2>&1
)

# Display error message if any
if [[ -z "$message" ]]; then
  >&2 echo "$message"
fi

