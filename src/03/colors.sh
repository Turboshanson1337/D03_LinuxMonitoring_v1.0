#!/bin/bash
# Цвет текста:
WHITE='\033[37m'		#	${WHITE}		# белый цвет знаков
RED='\033[31m'			#	${RED}			# красный цвет знаков
GREEN='\033[32m'		#	${GREEN}		# зелёный цвет знаков
BLUE='\033[34m'			#	${BLUE}			# синий цвет знаков
PURPLE='\033[35m'		#	${PURPLE}		# фиолетовый цвет знаков
BLACK='\033[30m'		#	${BLACK}		# чёрный цвет знаков


# Цвет фона
BGWHITE='\033[47m'		#	${BGWHITE}      # белый цвет фона
BGRED='\033[41m'		#	${BGRED}        # красный цвет фона
BGGREEN='\033[42m'		#	${BGGREEN}      # зелёный цвет фона
BGBLUE='\033[44m'		#	${BGBLUE}       # синий цвет фона
BGPURPLE='\033[45m'	    #	${BGPURPLE}      # фиолетовый цвет фона
BGBLACK='\033[40m'		#	${BGBLACK}      # чёрный цвет фона

# Все атрибуты по умолчанию
NORMAL='\033[0m'        #	${NORMAL}		# все атрибуты по умолчанию

case $2 in
    0) case $1 in
        1) color=${WHITE};;
        2) color=${RED};;
        3) color=${GREEN};;
        4) color=${BLUE};;
        5) color=${PURPLE};;
        6) color=${BLACK};;
        esac;;
    1) case $1 in
        1) color=${BGWHITE};;
        2) color=${BGRED};;
        3) color=${BGGREEN};;
        4) color=${BGBLUE};;
        5) color=${BGPURPLE};;
        6) color=${BGBLACK};;
        esac
esac
if [ $1 != s ]; then
    echo $color
fi