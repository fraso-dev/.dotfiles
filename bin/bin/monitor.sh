#!/bin/bash

PRIMARY_OUTPUT=`xrandr | grep -w primary | cut -d ' ' -f 1`
RATE=144
MODE=3440x1440
DP='DisplayPort-0'

if [[ $PRIMARY_OUTPUT != $DP ]]; then
  xrandr --output $DP --mode $MODE --rate $RATE --primary
	notify-send --urgency=normal -t 3000 "$PRIMARY_OUTPUT - ${RATE}hz"
else
  exit 1;
fi
