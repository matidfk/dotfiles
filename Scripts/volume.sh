function get_volume_icon {
  if [ "$1" -lt 34 ]
  then
      echo -n "audio-volume-low-symbolic.symbolic.png"
  elif [ "$1" -lt 67 ]
  then
      echo -n "audio-volume-medium-symbolic.symbolic.png"
  elif [ "$1" -le 100 ]
  then
      echo -n "audio-volume-high-symbolic.symbolic.png"
  else
      echo -n "audio-volume-overamplified-symbolic.symbolic.png"
  fi
}

function get_volume {
    echo $(pactl get-sink-volume @DEFAULT_SINK@ | awk -F '/' '{ print $2 }' | sed 's/^ *//g' | sed 's/%//g')
}

case $1 in
up)
    pactl set-sink-volume @DEFAULT_SINK@ +10%
;;

down)
    pactl set-sink-volume @DEFAULT_SINK@ -10%
;;

*)
    echo "Specify up or down"
;;
esac

VOLUME=$(get_volume)
notify-send "Volume: $VOLUME%" \
-h int:value:$VOLUME \
-h string:x-dunst-stack-tag:myvolumescript \
-i /usr/share/icons/Adwaita/32x32/status/$(get_volume_icon $VOLUME) \
