#!/bin/bash
START=`date +%s.%N` # Задаем начальное выполнения скрипта - десятичное число в секундах с точностью до наносекунд
PATHDIR=$1

# проверяем что введено правильное имя существующего файла
. ./check.sh

#собираем информацию в переменные
. ./takeinfo.sh

#выводим информацию в терминал
. ./printinfo.sh





