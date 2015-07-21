#!/bin/sh

# Place in /etc/portage/postsync.d and drop the .sh suffix.
# Would be nice if this could also run after every package installation.

if [ -f /var/tmp/.updates ]; then
    rm /var/tmp/.updates
fi
