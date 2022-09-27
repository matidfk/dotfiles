#!/bin/sh
feh --bg-fill $(find /usr/share/wallpapers/ -mindepth 1 | shuf -n 1)
