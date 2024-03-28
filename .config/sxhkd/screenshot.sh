#!/bin/sh

opts=$1

SCREENSHOT_DIR=~/Pictures/Screenshot
SCROT_FILE_FORMAT="$(date +'%Y-%m-%d_%H:%M:%S_scrot.png')"

if [[ $opts == "fullscreen" ]]; then
    scrot "$SCREENSHOT_DIR/$SCROT_FILE_FORMAT"
elif [[ $opts == "region" ]]; then
    REGION_METHOD="$(slop -f '%x,%y,%w,%h')"
    scrot -a $REGION_METHOD -F "$SCREENSHOT_DIR/$SCROT_FILE_FORMAT"
else
    echo "No opts was given..."
fi

