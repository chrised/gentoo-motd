#!/bin/sh

# Place in /etc/portage/postsync.d and drop the .sh suffix.
# Would be nice if this could also run after every package installation.

rm /var/tmp/.updates
