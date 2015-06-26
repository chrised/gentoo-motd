#!/bin/bash

# Place in /usr/local/sbin and drop the .sh suffix.
# Configure this to run between once every minute and once every five.

cd /etc/motd.d

rm -f /tmp/motd-tmp
touch /tmp/motd-tmp

for SCRIPT in $(ls); do
    test -x ${SCRIPT} || continue

    ./${SCRIPT} >> /tmp/motd-tmp
done

echo >> /tmp/motd-tmp

mv /tmp/motd-tmp /etc/motd
