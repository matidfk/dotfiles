#!/bin/sh
feh --bg-fill --no-fehbg $(find /usr/share/wallpapers/ -mindepth 1 | shuf -n 1)
