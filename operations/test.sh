#!/usr/bin/bash

# mount | grep /run/media/Osama/ | cut -d"t" -f1 | cut -d"n" -f3 | sed 's#^#/run#' | while read line; do
# echo -e "\"$line\""
#	sleep 5 && echo "i slept " &
# done

# date && rsync -vrh /run/media/Osama/SANDISK/learnphp "/home/Osama/Desktop/Osama/Bash Scripting" /home/Osama/Desktop/Osama/test2 &
# rsync -vrh /run/media/Osama/SANDISK/learnphp "/home/Osama/Desktop/Osama/Bash Scripting" /home/Osama/Desktop/Osama/test3 && date


while getopts d: flag; do
  case "${flag}" in
  d) destination=${OPTARG} ;;
  esac
done

shift
for param in "$@"; do
  {
    echo "$param"
  }
done

echo "destination is $destination"
