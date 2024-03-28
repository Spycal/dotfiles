#!/bin/sh

BAT_DIR=/sys/class/power_supply
bat0_cap="$(cat $BAT_DIR/BAT0/capacity)"
bat1_cap="$(cat $BAT_DIR/BAT1/capacity)"
combine_bat_cap="$(expr $bat0_cap + $bat1_cap)"
bat_perc="$(expr $combine_bat_cap / 2)"

bat0_sta="$(cat $BAT_DIR/BAT0/status)"
bat1_sta="$(cat $BAT_DIR/BAT1/status)"

string=""
if [[ $bat0_sta == "Charging" ]] || [[ $bat1_sta == "Charging" ]]; then
   string+="󱐋 "
fi

icons=("󰁹" "󰂀" "󰁾" "󰁼" "󰁺")
if [[ $bat_perc > 90 ]]; then
    string+=${icons[0]}
elif [[ $bat_perc > 55 ]]; then
    string+=${icons[1]}
elif [[ $bat_perc > 25 ]]; then
    string+=${icons[2]}
elif [[ $bat_perc > 10 ]]; then
    string+=${icons[3]}
elif [[ $bat_perc > 1 ]]; then
    string+=${icons[4]}
fi

echo $string

