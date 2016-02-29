#!/usr/bin/env bash
# set -x

# tbd: wlan autodetedction

ifconfig wlan0 down

iw reg set BO
sleep 3
iwconfig wlan0mon txpower 30
sleep 3
iw reg get

macchanger -r wlan0
macchanger -r wlan1


