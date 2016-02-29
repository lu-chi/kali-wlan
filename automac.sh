#!/usr/bin/env bash
# set -x

wlans=($(airmon-ng | grep wlan | awk '{print $2}'))

[ ${#wlans[@]} -eq 0 ] && { echo "No wifi interfaces found. Quitting..."; exit 1; }
 
for idx in ${wlans[@]}
do
    echo "Found wlan: $idx"
    ifconfig $idx down
    macchanger -r $idx
    ifconfig $idx up
done



