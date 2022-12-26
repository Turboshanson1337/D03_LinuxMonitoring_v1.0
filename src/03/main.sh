#!/bin/bash
chmod +rx mask.txt colors.sh output.sh
FILE=colors.sh
if [ ! -f "$FILE" ]; then
    echo Error: missing file: $FILE
    exit
fi
FILE=output.sh
if [ ! -f "$FILE" ]; then
    echo Error: missing file: $FILE
    exit
fi
source ./colors.sh s
if [ $# -ne 4 ]; then
echo "Only 4 parameters allowed"
else
    for var in "$@"
    do
    if [[ $var =~ ^[0-9]+$ ]]; then
        if [[ $var != [1-6] ]]; then
        echo "Parameters should be in range from 1 to 6."
        exit
        fi
    else
    echo "Only numeric parameters allowed"
    exit
    fi
    done
    if [ $1 -eq $2 ] || [ $3 -eq $4 ]; then
    echo "Parameters shouldn't be equal"
    else
    bg=1
    param1=$(./colors.sh $1 $bg)
    bg=0
    param2=$(./colors.sh $2 $bg)
    bg=1
    param3=$(./colors.sh $3 $bg)
    bg=0
    param4=$(./colors.sh $4 $bg)
    ./output.sh $param1 $param2 $param3 $param4 $NORMAL
    fi
fi
