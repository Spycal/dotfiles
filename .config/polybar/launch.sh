#!/bin/sh

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar main 2>&1 | tee -a /tmp/polybar1.log & disown
polybar side 2>&1 | tee -a /tmp/polybar2.log & disown

if type "xrandr"; then
    for m in $(monitor --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload main &
    done 
else 
    polybar --reload main &
end

echo "Polybar: The train is launching!"
