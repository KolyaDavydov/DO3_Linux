#!/bin/bash

echo "Total number of folders (including all nested ones) = $TOTALFOLDER"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "$TOP5FOLDER"
echo "Total number of files = $TOTALFILES"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $TOTALCONF"
echo "Text files = $TOTALTXT"
echo "Executable files = $TOTALEXE"
echo "Log files (with the extension .log) = $TOTALLOG"
echo "Archive files = $TOTALARCHIVE"
echo "Symbolic links = $TOTALLINK"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
echo "$TOP10FILES"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
echo "$TOP10EXE"
END=`date +%s.%N`
TIME=`echo "$END-$START" | bc`
printf "Script execution time (in seconds) = %.1f\n" $TIME
