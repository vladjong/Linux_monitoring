#!/bin/bash

if [[ $1 =~ ^-?[0-9]+([.][0-9]+)?$ ]]
then
    echo Error
else
    echo $1
fi