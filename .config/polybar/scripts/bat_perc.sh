#!/bin/sh

BAT_DIR=/sys/class/power_supply
bat0_cap="$(cat $BAT_DIR/BAT0/capacity)"
bat1_cap="$(cat $BAT_DIR/BAT1/capacity)"
combine_bat_cap="$(expr $bat0_cap + $bat1_cap)"
bat_perc="$(expr $combine_bat_cap / 2)%"

echo $bat_perc
