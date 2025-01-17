#!/bin/bash

KEYBOARD=/dev/input/by-path/platform-i8042-serio-0-event-kbd
EVENT="type 17 (EV_LED), code 1 (LED_CAPSL), value 1"
EVENT0="type 17 (EV_LED), code 1 (LED_CAPSL), value 0"
sudo evtest "$KEYBOARD" | \
while read line
do
    if [[ "$line" == *"$EVENT" ]]
    then
        notify-send -t 700 -u low "Caps Lock ON"
    elif [[ "$line" == *"$EVENT0" ]]
    then
	notify-send -t 700 -u low "Caps Lock Off"
    fi
done
