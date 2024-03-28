#!/bin/sh

BATTERY_DIR="/sys/class/power_supply"

while true; do
    BAT0_CAP="$(cat ${BATTERY_DIR}/BAT0/capacity)"
    BAT1_CAP="$(cat ${BATTERY_DIR}/BAT1/capacity)"
    COMBINE_BAT="$(expr $BAT0_CAP + $BAT1_CAP)"
    BAT_PERC="$(expr $COMBINE_BAT / 2)"

    BAT0_STA="$(cat ${BATTERY_DIR}/BAT0/status)"
    BAT1_STA="$(cat ${BATTERY_DIR}/BAT1/status)"

    echo "perc|int|$BAT_PERC"
    if [[ $BAT0_STA == "Charging" ]] || [[ $BAT1_STA == "Charging" ]] then
        echo "charging|bool|true"
    else
        echo "charging|bool|false"
    fi
    echo ""

    sleep 3
done



