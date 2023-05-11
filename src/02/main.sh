#!/bin/bash


. info_lib.sh # подключение библиотеки

if [ $# != 0 ]
then
    echo "ALARM!!! CRITICAL ERROR!!!"
else
    if [ -f info_lib.sh ]
    then
        info
        echo
        echo "want write date to file? (Y/N):"
        read answer

        if [[ $answer == "Y" || $answer == "y" ]]
        then
            info >> $(date "+%d_%m_%y_%H_%M_%S").status
        fi
    else
        echo "ALARM!!! file info_lib.sh not found!!!"
    fi
fi