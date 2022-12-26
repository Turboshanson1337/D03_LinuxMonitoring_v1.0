#!/bin/bash
# Цвет текста:
white='\033[37m'		#	${white}		# белый цвет знаков
red='\033[31m'			#	${red}			# красный цвет знаков
green='\033[32m'		#	${green}		# зелёный цвет знаков
blue='\033[34m'			#	${blue}			# синий цвет знаков
purple='\033[35m'		#	${purple}		# фиолетовый цвет знаков
black='\033[30m'		#	${black}		# чёрный цвет знаков


# Цвет фона
bgwhite='\033[47m'		#	${bgwhite}      # белый цвет фона
bgred='\033[41m'		#	${bgred}        # красный цвет фона
bggreen='\033[42m'		#	${bggreen}      # зелёный цвет фона
bgblue='\033[44m'		#	${bgblue}       # синий цвет фона
bgpurple='\033[45m'	    #	${bgpurple}      # фиолетовый цвет фона
bgblack='\033[40m'		#	${bgblack}      # чёрный цвет фона

# Все атрибуты по умолчанию
NORMAL='\033[0m'        #	${NORMAL}		# все атрибуты по умолчанию

case $2 in
    0) case $1 in
        1) color=$white;;
        2) color=$red;;
        3) color=$green;;
        4) color=$blue;;
        5) color=$purple;;
        6) color=$black;;
        esac;;
    1) case $1 in
        1) color=$bgwhite;;
        2) color=$bgred;;
        3) color=$bggreen;;
        4) color=$bgblue;;
        5) color=$bgpurple;;
        6) color=$bgblack;;
        esac
esac
if [[ $1 != s ]]; then
    echo $color
fi