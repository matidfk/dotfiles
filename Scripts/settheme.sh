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
  "waybar_style.css     $config_dir/waybar/style.css"
  "hyprland.lua         $config_dir/hypr/theme.lua"
  "hyprlock.conf        $config_dir/hypr/hyprlock.conf"
  "dunstrc              $config_dir/dunst/dunstrc"
  "kitty.conf           $config_dir/kitty/theme.conf"
  "bashprompt           $HOME/.bashprompt"
  "nvim.lua             $config_dir/nvim/config/theme.lua"
  "wofi.css             $config_dir/nvim/wofi/style.css"
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
  # wallpapers
  sudo rm -r /usr/share/wallpapers/* 2>&1
  sudo cp Wallpapers/* "/usr/share/wallpapers" 2>&1

   # Reload configs
  pkill waybar -USR2 2>&1
  dunstctl reload
)

# Display error message if any
if [[ -z "$message" ]]; then
  >&2 echo "$message"
fi

