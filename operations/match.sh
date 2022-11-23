# two loops
# first loop will loop over list of users files
# second loop is  over all detected devices
users="/home/Osama/Development/users/"

ls $users | while read file; do
    # echo "$file"
    cat files/path.txt | while read path; do
        ls "$path" | grep "$file" && echo "copy the content list in this file $users$file to this path $path/$file" && ./copy.sh -d"$path/$file" "$users$file" "$path" &
    done
done

# echo "hey there"
# any code you write here will be executed before the copy is done
