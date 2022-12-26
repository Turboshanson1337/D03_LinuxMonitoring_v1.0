#!/bin/bash
timer_start=$(date +%s)
chmod +rx main_work.sh
FILE=main_work.sh
if [ ! -f "$FILE" ]; then
    echo Error: missing script: $FILE
    exit
fi
if [ $# != 1 ]; then
    echo Should be only 1 parameter
elif ! [ -d $1 ]; then
    echo Directory not exist
elif [ ${1: -1} != "/" ]; then
    echo Directory path should end with '/'
else
    ./main_work.sh $1
    timer_end=$(date +%s)
    echo "Script execution time (in seconds) = $(($timer_end-$timer_start))"
fi