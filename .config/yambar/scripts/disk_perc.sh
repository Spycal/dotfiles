#!/bin/sh

while true; do 
    disk_perc=$(df --output=pcent / | tr -dc '0-9')
    
    echo "perc|int|$disk_perc"
    echo ""

    sleep 10m
done
