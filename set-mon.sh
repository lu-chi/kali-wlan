#!/usr/bin/env bash
# set -x 

[ -z ${1} ] && { echo "No param: wlan interface..."; exit 1; }

iface=${1}
count=${2:=3}

for ((i=1; i<=$count; i++))
do
    iw ${iface} interface add mon${i} type monitor
    macchanger -r mon${i}
done


