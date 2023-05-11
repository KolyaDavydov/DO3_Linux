#!/bin/bash

DEFAULT_FLAG=0 # если будет 1 , то дефолтные настройки

source info_lib.sh # подключение библиотеки
source config
source default_config

if [ $# != 0 ]
then
    echo "ALARM!!! SHOULD BE NO PARAMETRS!!!"
    exit
else
    if ! [[ -f config ]]
    then
        echo "ALARM!!! SOMEBODY DELETE CONFIG FILE!!!"
        exit
    else
        if ! [[ -f default_config ]]
        then
            echo "ALARM!!! SOMEBODY DELETE DEFAULT_CONFIG FILE!!!"
            exit
        fi
    fi
fi

# проверка параметров конфигурационного файла и устанофка флага DEFAULT_FLAG
. ./check.sh

# Функция которая задает цвета и запускает вывод информации
color