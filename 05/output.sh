#!/bin/bash

path=$1

startDate=$(date +%s)

echo "Total number of folders (including all nested ones) = $(find $path -type d | wc -l)"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
for dir in {2..6}
do
    echo -n "$(($dir - 1)) - "
    folder=$(du -h $path | sort -rh | head -6 | sed "${dir}q;d")
    if [[ -z $folder ]]
    then
        echo "not exist"
    else
        echo -n "$(echo $folder | awk '{print $2}'), "
        echo "$(echo $folder | awk '{print $1}')"
    fi
done
echo "etc up to 5"
echo "Total number of files = $(find $path -type f | wc -l)"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $(find $path -type f -name "*.conf" | wc -l)"
echo "Text files = $(find $path -type f -name "*.txt" | wc -l)"
echo "Executable files = $(find $path -type f -executable | wc -l)"
echo "Log files (with the extension .log) = $(find $path -type f -name "*.log" | wc -l)"
echo "Archive files = $(($(find $path -type f -name "*.zip" | wc -l) + $(find $path -type f -name "*.tar" | wc -l)))"
echo "Symbolic links = $(find $path -type l | wc -l)"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
for file in {1..10}
do
    echo -n "$file - "
    info=$(find $path -type f -exec du -Sh {} + | sort -rh | head -10 | sed "${file}q;d")
    if [[ -z $info ]]
    then
        echo "not exist"
    else
        echo -n "$(echo $info | awk '{print $2}'), "
        echo -n "$(echo $info | awk '{print $1}'), "
        echo "$(echo $info | grep -o "${path}.*" | grep -o "\..*" | awk -F . '{print $2}')"
    fi
done
echo "etc up to 10"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
for file in {1..10}
do
    echo -n "$file - "
    info=$(find $path -type f -executable -exec du -Sh {} + | sort -rh | head -10 | sed "${file}q;d")
    if [[ -z $info ]]
    then
        echo "not exist"
    else
        echo -n "$(echo $info | awk '{print $2}'), "
        echo -n "$(echo $info | awk '{print $1}'), "
        echo "$(echo $info | grep -o "${path}.*" | grep -o "\..*" | awk -F . '{print $2}')"
    fi
done
echo "etc up to 10"