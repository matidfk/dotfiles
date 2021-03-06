#!/bin/sh

# folder must be: ~/Themes/THEMENAME/
# folder must contain:
#   kitty.conf
#   picom.conf
#   polybar.ini

#   wallpaper.png
#      OR
#   Wallpapers
#	1.png
#	2.jpg
#	...

#   rofi.rasi



# choose random theme
THEMEDIR=$(ls ~/Themes | shuf -n 1)
 
if [[ $1 ]]; then
    THEMEDIR=$(ls ~/Themes | grep $1 | shuf -n 1)
fi

echo $THEMEDIR

cd ~/Themes/"$THEMEDIR"

# WALLPAPER
rm ~/.config/feh/*
if [[ -d ./Wallpapers ]]; then
    # /Wallpapers folder
    cp ./Wallpapers/"$(ls ./Wallpapers | shuf -n 1)" ~/.config/feh/
else
    # wallpaper.*
    cp "./$(ls wallpaper* | shuf -n 1)" ~/.config/feh/
fi
feh --no-fehbg --bg-fill "$(find ~/.config/feh/*.*)"

# BSPWM
if [[ -f ./bspwm.sh ]]; then
    cp ./bspwm.sh ~/.config/bspwm/theme.sh
    bash ~/.config/bspwm/bspwmrc
fi

# POLYBAR
cp ./polybar.ini ~/.config/polybar/config.ini
#if [[ $(pgrep polybar) ]]; then
#    pkill polybar
#    polybar 2>/dev/null &
#fi
pkill -USR1 polybar &

# PICOM
cp ./picom.conf ~/.config/picom/picom.conf
pkill -USR1 picom &

# KITTY
cp ./kitty.conf ~/.config/kitty/theme.conf
pkill -USR1 kitty &

# DUNST
cp ./dunstrc ~/.config/dunst/dunstrc
pkill -USR1 dunst &

# ROFI
cp ./rofi.rasi ~/.config/rofi/config.rasi

cd
