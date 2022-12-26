#!/bin/bash
a=$1
if [ $# = 1 ]; then
    check="^[+-]?[0-9]+([.][0-9]+)?$"
    if [[ $1 =~ $check ]]; then
        echo parameter should include letters;
    else
        echo $1;
    fi
elif [ $# \> 1 ]; then
    echo 1 argument allowed;
else
    echo should be 1 argument;
fi