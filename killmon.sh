#!/usr/bin/env bash


# stop all detected monitor interfaces
for i in $(airmon-ng | grep mon | awk '{print $2}')
do
    echo "Deleting interface: [$i]"
    iw $i interface del
done


