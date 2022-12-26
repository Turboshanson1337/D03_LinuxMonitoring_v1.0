#!/bin/bash
echo -e $1$2HOSTNAME =$5$3$4 $(hostname)$5
echo -e $1$2TIMEZONE =$5$3$4 "$(cat /etc/timezone) $(date +"(%Z, %z"))"$5
echo -e $1$2USER =$5$3$4 $(whoami)$5
echo -e $1$2OS =$5$3$4 $(hostnamectl | grep 'Operating System: ' | sed 's/Operating System: //')$5
echo -e $1$2DATE =$5$3$4 $(date +"%d %b %Y %T")$5
echo -e $1$2UPTIME =$5$3$4 $(uptime -p)$5
echo -e $1$2UPTIME_SEC =$5$3$4 $(awk '{print $1}' /proc/uptime)$5
echo -e $1$2IP =$5$3$4 $(ip a | grep "inet " | sed 's/\/../ /' | sed -n '1'p | awk '{print $2}')$5
echo -e $1$2MASK =$5$3$4 $(grep $(ip a | grep 'inet ' | grep -o '/..' | sed -n '1'p) ./mask.txt | awk '{print $3}')$5
echo -e $1$2GATEWAY =$5$3$4 $(ip r | grep 'default via' | awk '{print $3}')$5
echo -e $1$2RAM_TOTAL =$5$3$4 $(free | grep 'Mem' | awk '{printf "%.3f GB", $2 / 1048576}')$5
echo -e $1$2RAM_USED =$5$3$4 $(free | grep 'Mem' | awk '{printf "%.3f GB", $3 / 1048576}')$5
echo -e $1$2RAM_FREE =$5$3$4 $(free | grep 'Mem' | awk '{printf "%.3f GB", $4 / 1048576}')$5
echo -e $1$2SPACE_ROOT =$5$3$4 $(df -BK | grep '/$' | awk '{printf "%.2f MB", $2 / 1024}')$5
echo -e $1$2SPACE_ROOT_USED =$5$3$4 $(df -BK | grep '/$' | awk '{printf "%.2f MB", $3 / 1024}')$5
echo -e $1$2SPACE_ROOT_FREE =$5$3$4 $(df -BK | grep '/$' | awk '{printf "%.2f MB", $4 / 1024}')$5