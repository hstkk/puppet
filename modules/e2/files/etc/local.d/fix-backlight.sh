#!/bin/sh
# https://gist.github.com/1082058

BRIGHTNESS=/sys/class/backlight/intel_backlight/brightness

while inotifywait -e modify ${BRIGHTNESS} >/dev/null 2>&1; do
	setpci -s 00:02.0 F4.b=00
done

