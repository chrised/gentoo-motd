#!/bin/sh

sudo mkdir -p /etc/motd.d
sudo cp ./00-header.sh /etc/motd.d/00-header
sudo cp ./10-links.sh /etc/motd.d/10-links
sudo cp ./20-updates.sh /etc/motd.d/20-updates
sudo cp ./99-footer.sh /etc/motd.d/99-footer

sudo cp check-updates.sh /usr/local/sbin/check-updates
sudo cp update-motd.sh /usr/local/sbin/update-motd

sudo cp z-motd.sh /etc/portage/postsync.d/z-motd

sudo chmod +x /usr/local/sbin/check-updates
sudo chmod +x /usr/local/sbin/update-motd
sudo chmod +x /etc/motd.d/00-header
sudo chmod +x /etc/motd.d/10-links
sudo chmod +x /etc/motd.d/20-updates
sudo chmod +x /etc/motd.d/99-footer

sudo cp maintainer /etc/
sudo cp maintainer-address /etc/
sudo cp motd.service /etc/systemd/system/
sudo cp motd.timer /etc/systemd/system/
sudo systemctl enable motd.timer
sudo systemctl start motd.timer
