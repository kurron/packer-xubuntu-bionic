#!/usr/bin/env bash

# sometimes the background update process runs and captures the lock
until sudo apt-get -y update; do echo "Waiting for apt lock"; sleep 5; done

echo 'Deleting downloaded files...'
sudo rm -f /home/vagrant/Downloads/*

echo 'Clearing APT cache...'
until sudo apt-get -y update; do echo "Waiting for apt lock"; sleep 5; done
sudo apt-get clean

echo 'Zeroing device to make space...'
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
sudo sync
