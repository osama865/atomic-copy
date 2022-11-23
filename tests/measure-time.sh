# simple script that measures approximately speed of copy
# input the amount of data (A) and the rate or speed (S) of transfer
# into the equation T = A ÷ S
# $1 is the file path that contains all the folders paths
# needed to be transfered

# loop through every path/directory and get its size
#cat $1 | while read line ; do
#echo "here we go to copy files"
#echo $line
#size=$(du --block-size=M "$line" | cut -d"M" -f1)
#done

file=$(cat $1)

size=0
fileSize=0
while read line; do
    fileSize=$(du -h -s --block-size=M "$line" | cut -d"M" -f1)
    echo "$line"
    #echo $fileSize
    #echo $line
    size=$(($size + $fileSize))
done <$1

echo "the total size of all data that will be transfer is $size Mb "

speed=$(cat files/speed.txt)

echo "the approximate speed of data transfermation is $speed Mb/s"
# time datasize / speedofcopy

ESA=$(($size / $speed))

echo "estemated time for arrival is $ESA "
echo $ESA >files/esa.txt

# first argument is the source file that contains all data need to transfer
# second argument is the total size of the data in megabytes
# third argument is the distenation, where the data must be transfered
./measure-copy.sh "$1" $size "$2"
