#!/bin/bash

# Проверка на пустой параметр
if [ -z "$1" ] 
then
  echo "ALARM!!! Exit script. need one parametr fo example 'main.sh /var/log/"
  exit 1
# Проверка на то что параметров больше 1
# $# - количество параметров переданных скрипту
elif [[ $# -gt 1 ]]
then
  echo "ALARM!!! Exit script. need only one parametr fo example 'main.sh /var/log/"
  exit 1
fi
# Проверка на то что 1-ый параметр в конце содержит знак "/"
if [[ ${PATHDIR: - 1} != "/" ]]
then
  echo "ALARM!!! in the end of parametr shuld be: \"/\"."
  exit 1
fi
# Проверка существования каталога
if [[ ! -d "$1" ]]
then
  echo "No such folder!"
  exit 1
fi