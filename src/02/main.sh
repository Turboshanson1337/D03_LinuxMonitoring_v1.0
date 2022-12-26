#!/bin/bash
chmod +rx mask.txt save_to_file.sh
FILE=save_to_file.sh
if [ ! -f "$FILE" ]; then
    echo Error: missing file: $FILE
    exit
fi
tmpfile="tmp"
echo HOSTNAME = $(hostname) | tee -a $tmpfile
echo TIMEZONE = $(timedatectl | grep 'Time zone: ' | sed 's/Time zone: //') | tee -a $tmpfile
echo USER = $(whoami) | tee -a $tmpfile
echo OS = $(hostnamectl | grep 'Operating System: ' | sed 's/Operating System: //') | tee -a $tmpfile
echo DATE = $(date +"%d %b %Y %T") | tee -a $tmpfile
echo UPTIME = $(uptime -p) | tee -a $tmpfile
echo UPTIME_SEC = $(awk '{print $1}' /proc/uptime) | tee -a $tmpfile
echo IP = $(ip a | grep "inet " | sed 's/\/../ /' | sed -n '1'p | awk '{print $2}') | tee -a $tmpfile
echo MASK = $(grep $(ip a | grep 'inet ' | grep -o '/..' | sed -n '1'p) ./mask.txt | awk '{print $3}') | tee -a $tmpfile
echo GATEWAY = $(ip r | grep 'default via' | awk '{print $3}') | tee -a $tmpfile
echo RAM_TOTAL = $(free | grep 'Mem' | awk '{printf "%.3f GB", $2 / 1048576}') | tee -a $tmpfile
echo RAM_USED = $(free | grep 'Mem' | awk '{printf "%.3f GB", $3 / 1048576}') | tee -a $tmpfile
echo RAM_FREE = $(free | grep 'Mem' | awk '{printf "%.3f GB", $4 / 1048576}') | tee -a $tmpfile
echo SPACE_ROOT = $(df -BK | grep '/$' | awk '{printf "%.2f MB", $2 / 1024}') | tee -a $tmpfile
echo SPACE_ROOT_USED = $(df -BK | grep '/$' | awk '{printf "%.2f MB", $3 / 1024}') | tee -a $tmpfile
echo SPACE_ROOT_FREE = $(df -BK | grep '/$' | awk '{printf "%.2f MB", $4 / 1024}') | tee -a $tmpfile
./save_to_file.sh $tmpfile
rm $tmpfile
