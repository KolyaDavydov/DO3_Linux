#!/bin/bash

# массив цветов для вывода информации
COLORS=(
    default
    white
    red
    green
    blue
    purple
    black
)

function color {

    #Cоздаем массивы с описанием цветов
# \033[107m фон белый
# \033[41m  фон красный
# \033[42m  фон зеленый
# \033[104m фон синий
# \033[45m  фон пурпурный
# \033[40m  фон черный
    back_color=("\033[107m" "\033[41m" "\033[42m" "\033[104m" "\033[45m" "\033[40m")

# \033[97m  шрифт белый
# \033[31m  шрифт красный
# \033[32m  шрифт зеленый
# \033[94m  шрифт синий
# \033[35m  шрифт пурпурный
# \033[30m  шрифт черный
    letter_color=("\033[97m" "\033[91m" "\033[92m" "\033[96m" "\033[95m" "\033[30m")
    e='\033[0m' # отменяет изменения цветов
    
    info "${back_color[$(($column1_background-1))]}" "${letter_color[$(($column1_font_color-1))]}" "${back_color[$(($column2_background-1))]}" "${letter_color[$(($column2_font_color-1))]}"
}

function info {
    echo -e $1$2HOSTNAME$e = $3$4$(hostname)$e
    echo -e $1$2TIMEZONE$e = $3$4$(cat /etc/timezone) $(date -u +%Z) $(date +%:::z)$e
    echo -e $1$2USER$e = $3$4$(whoami)$e
    echo -e $1$2OS$e = $3$4$(awk '{print $1, $2, $3}' /etc/issue)$e
    echo -e $1$2DATE$e = $3$4$(date +"%d %b %Y %T")$e
    echo -e $1$2UPTIME$e = $3$4$(uptime -p)$e
    echo -e $1$2UPTIME_SEC$e = $3$4$(awk '{print $1}' /proc/uptime)$e
    echo -e $1$2IP$e = $3$4$(hostname -I)$e
    echo -e $1$2MASK$e = $3$4$(ifconfig | grep $(hostname -I) | awk '{print $4}')$e
    echo -e $1$2GATEWAY$e = $3$4$(ip r | grep default | awk '{print $3}')$e
    echo -e $1$2RAM_TOTAL$e = $3$4$(free -tm | grep Total: | awk '{printf "%.3f GB", $2/1024}')$e
	echo -e $1$2RAM_USED$e = $3$4$(free -tm | grep Total: | awk '{printf "%.3f GB", $3/1024}')$e
	echo -e $1$2RAM_FREE$e = $3$4$(free -tm | grep Total: | awk '{printf "%.3f GB", $4/1024}')$e
    echo -e $1$2SPACE_ROOT$e = $3$4$(df -k | grep "\/$" | awk '{printf "%.2f\n MB", $2/1024}')$e
	echo -e $1$2SPACE_ROOT_USED$e = $3$4$(df -k | grep "\/$" | awk '{printf "%.2f\n MB", $3/1024}')$e
	echo -e $1$2SPACE_ROOT_FREE$e = $3$4$(df -k | grep "\/$" | awk '{printf "%.2f\n MB", $4/1024}')$e

    echo

    if [[ $DEFAULT_FLAG -eq 0 ]]
    then
        echo "Column 1 background = $column1_background (${COLORS[$column1_background]})"
        echo "Column 1 font color = $column1_font_color (${COLORS[$column1_font_color]})"
        echo "Column 2 background = $column2_background (${COLORS[$column2_background]})"
        echo "Column 2 font color = $column2_font_color (${COLORS[$column2_font_color]})"
    else 
        echo "Column 1 background = default (${COLORS[$default_column1_background]})"
        echo "Column 1 font color = default (${COLORS[$default_column1_font_color]})"
        echo "Column 2 background = default (${COLORS[$default_column2_background]})"
        echo "Column 2 font color = default (${COLORS[$default_column2_font_color]})"
    fi
}