#!/usr/bin/env bash

killall -q polybar

echo "---" | tee -a /tmp/polybar.log
# polybar example >> /tmp/polybar.log 2>&1 &

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1 | tac ); do
    MONITOR=$m polybar --reload example &
  done
else
  polybar --reload example &
fi

echo "Bar launched..."
