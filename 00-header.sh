#!/bin/sh

# Place in /etc/motd.d and drop the .sh suffix.

echo -e "\n\033[1mWelcome to Gentoo Linux!\033[0m"

echo -e "\nThis server is maintained by \033[1m$(cat /etc/maintainer)\033[0m."
echo -e "Contact \033[1m$(cat /etc/maintainer-address)\033[0m for support."

echo -en "\n \033[1;32m*\033[0m "
cat /etc/gentoo-release
echo -en " \033[1;32m*\033[0m "

uname -snmpr

MAX=$(($(cat /proc/cpuinfo | grep processor | wc -l) - 1))
LOAD=$(cat /proc/loadavg | cut -d '.' -f 1)

if [ $LOAD -gt $(($MAX * 4)) ]
then echo -en " \033[1;31m*\033[0m"
elif [ $LOAD -gt $MAX ]
then echo -en " \033[1;33m*\033[0m"
else echo -en " \033[1;32m*\033[0m"
fi
uptime

echo -en " \033[1;32m*\033[0m IPv4 Network Interfaces: \033[1m"
ifconfig | grep 'inet ' | cut -d ' ' -f 10 | tr '\n' ' '
echo -e "\033[0m"

echo -en " \033[1;32m*\033[0m IPv6 Network Interfaces: \033[1m"
ifconfig | grep 'inet6 ' | cut -d ' ' -f 10 | tr '\n' ' '
echo -e "\033[0m"
