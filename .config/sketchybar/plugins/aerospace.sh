#!/usr/bin/env bash

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME background.drawing=on
    sketchybar --set $NAME label.drawing=on
else
    sketchybar --set $NAME background.drawing=off
    sketchybar --set $NAME label.drawing=off
fi
