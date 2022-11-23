#!/bin/bash
# https://linuxhint.com/rsync_copy_files/
# NOTE : Note: Specifying “/” after the source directory only copies the contents of the directory. 
# If we do not specify the “/”after the source directory, the source directory will also be copied to the destination directory.

# rsync -vrh /run/media/Osama/SANDISK/learnphp "/home/Osama/Desktop/Osama/Bash Scripting" /home/Osama/Desktop/Osama/test2 &
# rsync -vrh /run/media/Osama/SANDISK/learnphp "/home/Osama/Desktop/Osama/Bash Scripting" /home/Osama/Desktop/Osama/test3 && date
while getopts d: flag
do
    case "${flag}" in
        d) destination=${OPTARG};;
    esac
done
shift
#echo "$1"

mountpoint="$2"

cat $1 | while read line ; do
#echo "here we go to copy files"
echo $line
rsync -v -r -h --progress -P "$line" "$destination"
done
echo "destination is $destination"
echo "THE COPY OPERATION IS FINISHED, DO SOME CLEAN UP HERE."

echo "the copy operation for this device $mountpoint is completed "
# umount "$mountpoint"

./clean.sh

# add some benchmarking
# add unmount.sh to unmount all listed devices in path.txt (changeit to mountpoints.txt)
# fire udev rule to stop auto-copy.service from running on remove.
# add clear.sh to clear path.txt, so the next time everything will have a fresh start
