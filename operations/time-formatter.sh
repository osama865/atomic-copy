# time converter, takes time in seconds and return it formatted in 91733 => 1d 1h 28m 53s
# show_time2 only return hours, minutes and seconds
# show_time3 only return minutes and seconds

function show_time() {
    num=$1
    min=0
    hour=0
    day=0
    if ((num > 59)); then
        ((sec = num % 60))
        ((num = num / 60))
        if ((num > 59)); then
            ((min = num % 60))
            ((num = num / 60))
            if ((num > 23)); then
                ((hour = num % 24))
                ((day = num / 24))
            else
                ((hour = num))
            fi
        else
            ((min = num))
        fi
    else
        ((sec = num))
    fi
    echo "$day"d "$hour"h "$min"m "$sec"s
}

show_time $1

function show_time2() {
    num=$1
    min=0
    hour=0
    day=0
    if ((num > 59)); then
        ((sec = num % 60))
        ((num = num / 60))
        if ((num > 59)); then
            ((min = num % 60))
            ((num = num / 60))
            if ((num > 23)); then
                ((hour = num))
            else
                ((hour = num))
            fi
        else
            ((min = num))
        fi
    else
        ((sec = num))
    fi
    echo "$day"d "$hour"h "$min"m "$sec"s
}

show_time2 $1

function show_time3() {
    num=$1
    min=0
    hour=0
    day=0
    if ((num > 59)); then
        ((sec = num % 60))
        ((num = num / 60))
        ((min = num))
    else
        ((sec = num))
    fi
    echo "$day"d "$hour"h "$min"m "$sec"s
}

show_time3 $1
