#!/bin/bash

fontColors=("\033[97m" "\033[31m" "\033[32m" "\033[34m" "\033[95m" "\033[30m")
backgroundColors=("\033[107m" "\033[41m" "\033[42m" "\033[44m" "\033[105m" "\033[40m")

VNBC=${backgroundColors[$1 - 1]}
VNFC=${fontColors[$2 - 1]}
VBC=${backgroundColors[$3 - 1]}
VFC=${fontColors[$4 - 1]}
NC="\e[0m"

echo -e ${VNBC}${VNFC}HOSTNAME${NC} = ${VBC}${VFC}$(hostname)${NC}
echo -e ${VNBC}${VNFC}TIMEZONE${NC} = ${VBC}${VFC}$(cat /etc/timezone && TZ=UTC date +%Z && date +%Z)${NC}
echo -e ${VNBC}${VNFC}OS${NC} = ${VBC}${VFC}$(uname -mrs)${NC}
echo -e ${VNBC}${VNFC}DATE${NC} = ${VBC}${VFC}$(date +"%d %b %Y %H:%M:%S")${NC}
echo -e ${VNBC}${VNFC}UPTIME${NC} = ${VBC}${VFC}$(uptime -p)${NC}
echo -e ${VNBC}${VNFC}UPTIME_SEC${NC} = ${VBC}${VFC}$(cat /proc/uptime | awk '{print $1}')${NC}
echo -e ${VNBC}${VNFC}IP${NC} = ${VBC}${VFC}$(hostname -I | awk '{print $1}')${NC}
echo -e ${VNBC}${VNFC}MASK${NC} = ${VBC}${VFC}$(route -n | sed -n '4'p | awk '{print $3}')${NC}
echo -e ${VNBC}${VNFC}RAM_TOTAL${NC} = ${VBC}${VFC}$(free | sed -n '2'p | awk '{printf ("%.3f Gb", $2 / 1024 / 1024)}')${NC}
echo -e ${VNBC}${VNFC}RAM_USED${NC} = ${VBC}${VFC}$(free | sed -n '2'p | awk '{printf ("%.3f Gb", $3 / 1024 / 1024)}')${NC}
echo -e ${VNBC}${VNFC}RAM_FREE${NC} = ${VBC}${VFC}$(free | sed -n '2'p | awk '{printf ("%.3f Gb", $4 / 1024 / 1024)}')${NC}
echo -e ${VNBC}${VNFC}RAM_FREE${NC} = ${VBC}${VFC}$(free | sed -n '2'p | awk '{printf ("%.3f Gb", $4 / 1024 / 1024)}')${NC}
echo -e ${VNBC}${VNFC}SPACE_ROOT${NC} = ${VBC}${VFC}$(df | sed -n '4'p | awk '{printf ("%.2f Mbi", $2 / 1024)}')${NC}
echo -e ${VNBC}${VNFC}SPACE_ROOT_USED${NC} = ${VBC}${VFC}$(df | sed -n '4'p | awk '{printf ("%.2f Mbi", $3 / 1024)}')${NC}
echo -e ${VNBC}${VNFC}SPACE_ROOT_FREE${NC} = ${VBC}${VFC}$(df | sed -n '4'p | awk '{printf ("%.2f Mbi", $4 / 1024)}')${NC}