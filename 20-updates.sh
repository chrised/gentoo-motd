#!/bin/bash

# Place in /etc/motd.d and drop the .sh suffix.

if [ ! -f /var/tmp/.updates ] ; then
    /usr/local/sbin/check-updates > /var/tmp/.updates
    /bin/chown portage:portage /var/tmp/.updates
fi

cat /var/tmp/.updates
