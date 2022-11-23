#size=$(du --block-size=M "$src" | cut -d"M" -f1)
#echo $size

dist="$3"
start=$SECONDS

# espeak -s 150 "all copy operation started"

while read line; do
    rsync -r "$line" "$dist"
done < $1

end=$(($SECONDS - start))
echo $end
speed=$(($2 / $end))
echo $speed > files/speed.txt
echo "estimated data copy speed is $speed mbs"
gtts-cli "all copy operations finished, please remove the drivers"
