#!/bin/sh
SINK=$(pacmd list-sinks|awk '/\* index:/{ print $3 }')
pactl set-sink-volume "$SINK" +10%
