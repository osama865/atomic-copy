# simple script that measures approximately speed of copy
# will write the speed in tmp file

dist="/run/media/Osama/TOSHIBA EXT/2736f23hdsdkl"
src="/home/Osama/Desktop/Osama/ANIME/Dragon Ball/64.mp4"
srcfile="/home/Osama/Development/users/2736f23hdsdkl"

size=$(du --block-size=M "$src" | cut -d"M" -f1)
echo " the test file size is $size"

start=$SECONDS
rsync "$src" "$dist"
end=$(($SECONDS - start))

speed=$(($size / $end))

echo $speed >files/speed.txt

echo " estimated data copy speed is $speed mb/s"

measure-time.sh "$srcfile" "$dist"
