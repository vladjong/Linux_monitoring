#!/bin/bash

if [[ $# -ne 4 ]]
then
    echo "Error: Incorrect number of variables!"
    echo "Enter 4 color values!"
    exit
fi

if [[ ($1 -eq $2) || ($3 -eq $4) ]]
then
    echo "Error: Same font and background color values!"
    echo "Enter different background colors and colors!"
    exit
fi

for var in $@
do
    if [[ ($var -lt 1) || ($var -gt 6) ]]
    then
        echo "Error: Invalid value of argument - $var!"
        echo "Correct the value of the variable!"
        exit
    fi
done

./output.sh $1 $2 $3 $4