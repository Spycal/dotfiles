#!/bin/sh

BATTERY_DIR="/sys/class/power_supply"
BAT0_STAT=$(cat ${BATTERY_DIR}/BAT0/status)
BAT1_STAT=$(cat ${BATTERY_DIR}/BAT1/status)

while :; do
    if [[ $BAT0_STAT == "Charging" ]] || [[ $BAT1_STAT == "Charging" ]]; then
        notify-send -u critical "BATTERY IS CHARGING" "Please unplug the laptop charger"
    fi
    sleep 3m
done

