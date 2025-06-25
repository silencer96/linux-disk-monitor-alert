#!/bin/bash

THRESHOLD=80
TO="sakthisanjai9600@gmail.com"
HOSTNAME=$(hostname)

df -h | grep '^/dev/' | while read line; do
    usage=$(echo $line | awk '{print $5}' | sed 's/%//')
    mountpoint=$(echo $line | awk '{print $6}')

    if [ "$usage" -ge "$THRESHOLD" ]; then
        echo "Warning: $mountpoint is ${usage}% full on $HOSTNAME" | \
        mail -s "Disk Alert: $mountpoint usage is ${usage}%" $TO
    fi
done
