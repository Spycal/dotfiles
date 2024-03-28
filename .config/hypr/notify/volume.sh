#!/bin/sh

get_vol_perc=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))
input=$1

if [[ "$input" == "--inc" ]]; then
    amixer --quiet sset Master 5%+
elif [[ "$input" == "--dec" ]]; then
    amixer --quiet sset Master 5%-
fi

if [[ "$input" == "--inc" ]] || [[ "$input" == "--dec" ]]; then
    notify-send "Volume $get_vol_perc" -h int:value:$get_vol_perc
elif [[ -z "$input" ]]; then
    echo "No option was given"
else    
    echo "You typing random letter..."
fi
