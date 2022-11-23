# Clean after all operations finished
# >files/path.txt

# echo "all the mountpoints cleared"

#mountpoint="$1"

#echo "$mountpoint"
#umount "$mountpoint"

# cmountpoints stands for current mount points aka (the current mounted devices)
cmountpoints=$(mount | grep /run/media/Osama/ | cut -d"t" -f1 | cut -d"n" -f3 | sed 's#^#/run#')

if [ -z "$cmountpoints" ]
then
      echo "\$cmountpoints is empty"
      # if is empty then all good and clean the path.txt now
	truncate -s 0 files/path.txt
	# if again there is no devices didn't unmount successfully,
	# also clear the retry.txt
	truncate -s 0 files/retry.txt
else
      echo "\$cmountpoints is NOT empty"
	# if its not empty, then well something wrong happend with the copy,
	# the good news is now using the $cmountpoints will detect the
	# devices that had an issue, so you can write'em to retry.txt
	# So you can re copy the data to only devices wich had an issue.
	mount | grep /run/media/Osama/ | cut -d"t" -f1 | cut -d"n" -f3 | sed 's#^#/run#' > files/retry.txt
	# you can clear path.txt now, you had all the failed devices mountpoints in retry.txt
	# no need for ones in path.txt anymore
	truncate -s 0 files/path.txt
fi

echo "$cmountpoints"
# if the cmountpoints is empty, which means all the copy operations is done and the devices has been unmounted
# succssesfully, then clear the path.txt, you need to clear it to make it empty for the next use
# i mean the next time there is devices to copy data to them.


