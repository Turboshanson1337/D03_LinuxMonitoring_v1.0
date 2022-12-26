#!/bin/bash
chmod +rx colors.sh output.sh check_conf.sh mask.txt params.conf
FILE=check_conf.sh
if [ ! -f "$FILE" ]; then
    echo Error: missing file: $FILE
    exit
fi
source check_conf.sh
source colors.sh s

get_color() {
    res=0
    case $1 in
    1) res="(white)";;
    2) res="(red)";;
    3) res="(green)";;
    4) res="(blue)";;
    5) res="(purple)";;
    6) res="(black)";;
    esac
    echo $res
}

if [ $column1_background -eq $column1_font_color ] || [ $column2_font_color -eq $column2_background ]; then
    echo "Equal parameters in one column forbidden"
else
    bg=1
    param1=$(./colors.sh $column1_background $bg)
    bg=0
    param2=$(./colors.sh $column1_font_color $bg)
    bg=1
    param3=$(./colors.sh $column2_background $bg)
    bg=0
    param4=$(./colors.sh $column2_font_color $bg)
    ./output.sh $param1 $param2 $param3 $param4 $NORMAL
    echo
    echo Column 1 background = $( if [[ $default1 = 1 ]] ; then echo default ; else echo $column1_background ; fi ; ) $(get_color $column1_background)
    echo Column 1 font color = $( if [[ $default2 = 1 ]] ; then echo default ; else echo $column1_font_color ; fi ; ) $(get_color $column1_font_color)
    echo Column 2 background = $( if [[ $default3 = 1 ]] ; then echo default ; else echo $column2_background ; fi ; ) $(get_color $column2_background)
    echo Column 2 font color = $( if [[ $default4 = 1 ]] ; then echo default ; else echo $column2_font_color ; fi ; ) $(get_color $column2_font_color)
fi