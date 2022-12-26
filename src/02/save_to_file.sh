#!/bin/bash
echo -n "Write down results in file? (Y/N)"
read item
case "$item" in
    y|Y) cp $1 $(date +"%d_%m_%y_%H_%M_%S").status;;
    *) echo "Aborting";;
esac
