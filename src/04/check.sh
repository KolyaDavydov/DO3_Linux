#!/bin/bash

color_str=(
    $column1_background
    $column1_font_color
    $column2_background
    $column2_font_color
)

# Проверка параметров config файла что, они содержат только цифры
# $@- перечисление каждого параметра скрипта (параметры по отдельности)
for i in "${!color_str[@]}"
do  
  if [[ ${color_str[$i]} != *[[:digit:]]* ]]  # digit - класс символов POSIX
  then
    echo "SETTING DEFAULT - parametrs in config is not digit" 
    DEFAULT_FLAG=1
  fi
done


# Проверка параметров что, они содержат только цифры от 1 до 6
# $@- перечисление каждого параметра скрипта (параметры по отдельности)
for i in "${!color_str[@]}"
do
  if ! [[ ${color_str[$i]} =~ ^[1-6] ]]
  then
    echo "SETTING DEFAULT - parametrs in config is digit, but not in range 1 - 6"
    DEFAULT_FLAG=1

  fi
done


# Проверка что б фон и текст в одной колонке не совпадали

if [[ $column1_background == $column1_font_color || $column2_background == $column2_font_color ]]
then
    echo "SETTING DEFAULT - color background and text - equal"
    DEFAULT_FLAG=1
fi

# Если какой либо параметр в config файле не задан то ставим дефолтный флаг
if [[ -z $column1_background || -z $column2_background || -z $column1_font_color || -z $column2_font_color ]]
then
    echo "SETTING DEFAULT - in config have empty parametr"
    DEFAULT_FLAG=1
fi

#Если флаг установлен (== 1) то применяем дефольные настройки
if [[ DEFAULT_FLAG -eq 1 ]]
then
    column1_background=${default_column1_background}
    column1_font_color=${default_column1_font_color}
    column2_background=${default_column2_background}
    column2_font_color=${default_column2_font_color}
fi
