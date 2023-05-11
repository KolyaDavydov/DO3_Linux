#!/bin/bash

. info_lib.sh # подключение библиотеки

if [ $# != 4 ]
then
    echo "ALARM!!! SHOULD BE 4 PARAMETRS!!!"
    exit
else
    parametr="^[1-6]$"
    if ! [[ $1 =~ $parametr && $2 =~ $parametr && $3 =~ $parametr && $4 =~ $parametr ]]
    then
        echo "ALARM!!! PARAMS NOT IN RANGE: from 1 to 6!!!"
        exit
    else
        if [[ $1 == $2 || $3 == $4 ]]
        then
            echo "ALARM!!! PARAMS 1 and 2, 3 and 4 MUST BE DIFFERENT COLLOR!!!"
            exit
        else 
            if [ -f info_lib.sh ]
            then
                color "$1" "$2" "$3" "$4"
            else
                echo "ALARM!!! file info_lib.sh not found!!!"
                exit
            fi
        fi
    fi
fi