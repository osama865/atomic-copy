#!/usr/bin/bash

status=$(systemctl show -p ActiveState --value auto-copy.service)
echo "$status"
echo "Listed paths of all connected devices"

# sleep 10

mount | grep /run/media/Osama/ | cut -d"t" -f1 | cut -d"n" -f3 | sed 's#^#/run#' > files/path.txt && ./match.sh

while true; do
    # sleep 10
    # later change path.txt to mountpoints.txt
    echo "add mountpoints to path.txt"
    
    if [[ $status == "running" ]]; then
        echo "the service is already running"
    fi
    
    if [[ $status == "inactive" ]]; then
        echo "the service is not running"
    fi
    
    # mount | grep /run/media/Osama/ | cut -d"t" -f1 | cut -d"n" -f3 | sed 's#^#/run#' > operations/path.txt
    
    
    sleep 20
done
# noroot.sh
