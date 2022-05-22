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
THEMEDIR="$(ls ~/Themes | shuf -n 1)"
 
if [[ $1 ]]; then
    THEMEDIR=$(ls ~/Themes | grep $1 | shuf -n 1)
fi

echo $THEMEDIR

cd ~/Themes/$THEMEDIR

rm ~/.config/feh/*.*
if [[ -d ./Wallpapers ]]; then
    # /Wallpapers folder
    cp ./Wallpapers/$(ls ./Wallpapers | shuf -n 1) ~/.config/feh/
else
    # wallpaper.*
    cp ./$(ls wallpaper* | shuf -n 1) ~/.config/feh/
fi
feh --no-fehbg --bg-fill "$(find ~/.config/feh/*.*)"


# POLYBAR
cp ./polybar.ini ~/.config/polybar/config.ini
if [[ $(pgrep polybar) ]]; then
    pkill polybar
    polybar 2>/dev/null &
fi

# PICOM
cp ./picom.conf ~/.config/picom/picom.conf
if [[ $(pgrep picom) ]]; then
    pkill picom
    picom 2>/dev/null &
fi

# KITTY
cp ./kitty.conf ~/.config/kitty/theme.conf
if [[ $(pgrep kitty) ]]; then
    kill -s USR1 $(pgrep kitty)
fi

# ROFI
cp ./rofi.rasi ~/.config/rofi/config.rasi

cd
