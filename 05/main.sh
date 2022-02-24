#!/bin/bash
startDate=$(date +%s)
path=$1

if [[ -d $path ]]
then
    ./output.sh $path
    endDate=$(date +%s)
    echo "Script execution time (in seconds) = "$(($endDate - $startDate))""
else
    echo "The $path directory does not exist"
fi