xset r rate 225 40 &
xset m 0 0 &
xrandr --output eDP1 --gamma 1:1.07:1
xrandr --output HDMI-1 --primary --auto --output VGA-1 --auto --right-of HDMI-1

~/Scripts/randomtheme.sh


exec feh --no-fehbg --bg-fill $(find ~/.config/feh/*.*) &

exec polybar &
exec picom --experimental-backends &

exec firefox &
exec discord &
exec kitty &

exec bspwm
#bspc node 

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
