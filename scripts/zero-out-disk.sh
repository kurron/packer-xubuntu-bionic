#!/bin/bash

echo 'Clearing APT cache...'
apt-get clean

echo 'Clearing out ~/Downloads directory...'
rm -rf /home/vagrant/Downloads/*.zip
rm -rf /home/vagrant/Downloads/*.gz
rm -rf /home/vagrant/Downloads/*.sh

echo 'Zeroing device to make space...'
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
sync
