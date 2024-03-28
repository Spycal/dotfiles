#!/bin/sh

SCREENSHOT_FILE_FORMAT="$(date +'%d-%m-%Y_%H:%M_grim.png')"
SCREENSHOT_FOLDER=~/Pictures/Screenshot/$SCREENSHOT_FILE_FORMAT

notify() {
    notify-send "Gotcha!" "Screenshot an image, stored in ~/Pictures/Screenshot/"
}

fullscreen_screenshot() {
    grim $SCREENSHOT_FOLDER
}

regional_screenshot() {
    grim -g "$(slurp)" $SCREENSHOT_FOLDER
}

if [[ "$1" == "-f" ]] || [[ "$1" == "--fullscreen" ]]; then
    fullscreen_screenshot
    notify
elif [[ "$1" == "-r" ]] || [[ "$1" == "--regional" ]]; then
    regional_screenshot
    notify
else
    echo "Cant process"
fi

    
