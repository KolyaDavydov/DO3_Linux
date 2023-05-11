#!/bin/bash

# `ls -lR` - файлы и папки списком включая вложенные
# grep ^d - папки (строки которые начинаются на d); wc -l - вывести количество строк
TOTALFOLDER=$(sudo ls $PATHDIR   -lR | grep ^d | wc -l)

# `du`` выводит списком размер папки и путь к ней (-h в человекочитаемом виде)
# sort сортирует строки вывода -rh d порядке убывания размера
# 
TOP5FOLDER=`sudo du -h $PATHDIR | sort -rh | head -5  | awk '{ printf "%d - %s, %s\n",FNR, $2, $1}'`

# `find` поиск и вывод файлов(-type f); wc -l количество строк
TOTALFILES=`sudo find $PATHDIR -type f | wc -l`

TOTALCONF=`sudo find $PATHDIR -name '*conf' | wc -l`

TOTALTXT=`sudo find $PATHDIR -name '*.txt' | wc -l`

TOTALEXE=`sudo find $DIRECTIRY -type f -perm -u+rx | wc -l`

TOTALLOG=`sudo find $PATHDIR -name '*.log' | wc -l`

TOTALARCHIVE=`sudo find $PATHDIR -name '*.tar' -o -name '*.gz' -o -name '*.bz2' -o -name '*.zip' -o -name '*.7z' | wc -l`

TOTALLINK=`sudo ls -l $PATHDIR | grep -c ^l`

# BEGIN {} - сначала выполняет этот блок команд
# name=split($2, a, ".") разбивает строку $2 на name элементов, в качестве разделителя - "."
TOP10FILES=`sudo find "$PATHDIR" -type f -exec du -hs {} + | sort -hr -k 1 | head -n 10 | awk 'BEGIN{i=1}{name=split($2, a, "."); printf "%d - %s, %s, %s\n", i, $2, $1, a[name]; i++}'`

# md5sum - вывод хэша, после адрес файла пишется.
TOP10EXE=`sudo find "$PATHDIR" -type f -executable -exec du -hs {} + | sort -hr -k 1 | head -n 10 | awk 'BEGIN{i=1}{"md5sum " $2 | getline m5s; close("md5sum"); idx=split(m5s, a, " "); printf "%d - %s, %s, %s\n", i, $2, $1, a[1]; i++}'`