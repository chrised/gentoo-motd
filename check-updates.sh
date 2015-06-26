#!/bin/sh

# Place in /usr/local/sbin and drop the .sh suffix.

SYS=$(emerge -uDNpq system | grep ebuild | wc -l)
WRL=$(emerge -uDNpq world | grep ebuild | wc -l)
SEC=$(glsa-check -l affected 2> /dev/null | grep \\[ | wc -l)
TOT=$(glsa-check -l all 2> /dev/null | grep \\[ | wc -l)
NEWS=$(eselect news list | grep unread | wc -l)

SYSC="\033[1;32m"
WRLC=$SYSC
SECC=$SYSC

if [ $SYS -gt 0 ] ; then
    SYSC="\033[1;33m"
fi

if [ $WRL -gt 0 ] ; then
    WRLC="\033[1;33m"
fi

if [ $SEC -gt 0 ] ; then
    SECC="\033[1;31m"
fi

echo -e "\nPortage and GLSA status:\n"
echo -e " ${SYSC}* ${SYS}\033[0m system packages have updates available."
echo -e " ${SECC}* ${SEC}\033[0m of \033[1m${TOT}\033[0m security advisories affect this server."
echo -e " ${WRLC}* ${WRL}\033[0m packages in total can be updated."

if [ $NEWS -gt 0 ] ; then
    echo -e "\n\033[1;33mImportant:\033[0m There are \033[1m${NEWS}\033[0m unread news items."
fi