#!/bin/sh

# Place in /etc/motd.d and drop the .sh suffix.

[ -f /etc/motd.tail ] && cat /etc/motd.tail || true