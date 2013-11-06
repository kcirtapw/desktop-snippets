#!/bin/bash

TIMEOUTFILE=/tmp/lidclose_switch
NOW=$(date +%s)
if [ ! -f "$TIMEOUTFILE" ]; then
    # no file (button never hit since system start)
	systemctl suspend
elif [ $NOW -gt $(< $TIMEOUTFILE) ]; then
    # button timed out
	systemctl suspend
else
    # switchmode in effect => screenlock
    systemctl start bluredi3lock
fi
