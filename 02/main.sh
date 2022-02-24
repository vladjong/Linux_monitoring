#!/bin/bash
touch text.txt
echo HOSTNAME = $(hostname) | tee -a text.txt
sudo timedatectl set-timezone Asia/Novosibirsk
echo TIMEZONE = $(cat /etc/timezone && TZ=UTC date '+%Z' && date '+%Z') | tee -a text.txt
echo USER = $(whoami) | tee -a text.txt
echo OS = $(uname -mrs) | tee -a text.txt
echo DATE = $(date +"%d %b %Y %H:%M:%S") | tee -a text.txt
echo UPTIME = $(uptime -p) | tee -a text.txt
echo UPTIME_SEC = $(cat /proc/uptime | awk '{print $1}') | tee -a text.txt
echo IP = $(hostname -I | awk '{print $1}') | tee -a text.txt
echo MASK = $(route -n | sed -n '4'p | awk '{print $3}') | tee -a text.txt
echo RAM_TOTAL = $(free | sed -n '2'p | awk '{printf ("%.3f Gb", $2 / 1024 / 1024)}') | tee -a text.txt
echo RAM_USED = $(free | sed -n '2'p | awk '{printf ("%.3f Gb", $3 / 1024 / 1024)}') | tee -a text.txt
echo RAM_FREE = $(free | sed -n '2'p | awk '{printf ("%.3f Gb", $4 / 1024 / 1024)}') | tee -a text.txt
echo SPACE_ROOT = $(df | sed -n '4'p | awk '{printf ("%.2f Mbi", $2 / 1024)}') | tee -a text.txt
echo SPACE_ROOT_USED = $(df | sed -n '4'p | awk '{printf ("%.2f Mbi", $3 / 1024)}') | tee -a text.txt
echo SPACE_ROOT_FREE = $(df | sed -n '4'p | awk '{printf ("%.2f Mbi", $4 / 1024)}') | tee -a text.txt
echo
read -p "Do you want to save the file? [Y/N]:" solution
if [[ $solution == "y" || $solution == "Y" ]]
then
    mv text.txt $(date '+%d_%m_%Y_%H_%M_%S').status
else
    rm text.txt
fi
