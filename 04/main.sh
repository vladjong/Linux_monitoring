#!/bin/bash

DEFAULT=0

if [[ "$(grep -c column1_background config_color.txt)" -eq 1 ]]
then
    VNBC=$(grep column1_background config_color.txt | awk -F = '{print $2}')
    if [[ (VNBC -lt 1) || (VNBC -gt 6) ]]
    then
    DEFAULT=1
    fi
else
    DEFAULT=1
fi

if [[ "$(grep -c column1_font_color config_color.txt)" -eq 1 ]]
then
    VNFC=$(grep column1_font_color config_color.txt | awk -F = '{print $2}')
    if [[ (VNFC -lt 1) || (VNFC -gt 6) ]]
    then
        DEFAULT=1
    fi
else
    DEFAULT=1
fi

if [[ "$(grep -c column2_background config_color.txt)" -eq 1 ]]
then
    VBC=$(grep column2_background config_color.txt | awk -F = '{print $2}')
    if [[ (VBC -lt 1) || (VBC -gt 6) ]]
    then
        DEFAULT=1
    fi
else
    DEFAULT=1
fi

if [[ "$(grep -c column2_font_color config_color.txt)" -eq 1 ]]
then
    VFC=$(grep column2_font_color config_color.txt | awk -F = '{print $2}')
    if [[ (VFC -lt 1) || (VFC -gt 6) ]]
    then
        DEFAULT=1
    fi
else
    DEFAULT=1
fi

if [[ (VNBC -eq VNFC) || (VBC -eq VFC) ]]
then
    DEFAULT=1
fi

if [[ DEFAULT -eq 1 ]]
then
    VNBC=6
    VNFC=1
    VBC=2
    VFC=4
fi
    
./output.sh $VNBC $VNFC $VBC $VFC

if [[ DEFAULT -eq 1 ]]
then
    echo "Column 1 background = default (black)"
    echo "Column 1 font color = default (white)"
    echo "Column 2 background = default (red)"
    echo "Column 2 font color = default (blue)"
else
    echo "Column 1 background = $VNBC"
    echo "Column 1 font color = $VNFC"
    echo "Column 2 background = $VBC"
    echo "Column 2 font color = $VFC"
fi