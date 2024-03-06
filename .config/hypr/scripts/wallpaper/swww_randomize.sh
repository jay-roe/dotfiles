#!/bin/bash
if [[ $# -lt 1 ]] || [[ ! -d $1   ]]; then
	echo "Usage:
	$0 <dir containing images>"
	exit 1
fi

# image transitions
export SWWW_TRANSITION_FPS=60

# time to switch (in seconds) to the next image
INTERVAL=300

while true; do
	find "$1" \
		| while read -r img; do
			echo "$((RANDOM % 1000)):$img"
		done \
		| sort -n | cut -d':' -f2- \
		| while read -r img; do
			swww img --transition-type wipe --transition-angle 30 "$img"
			sleep $INTERVAL
		done
done
