#!/usr/bin/env bash

until sudo apt-get --yes update; do echo "Waiting for apt lock"; sleep 5; done

# install required packages
sudo apt-get update
sudo apt-get --yes install gcc make perl

VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
VBOX_ISO=VBoxGuestAdditions_$VBOX_VERSION.iso
sudo mount -o loop ${VBOX_ISO} /mnt
sudo /mnt/VBoxLinuxAdditions.run
sudo umount /mnt

# Remove the guest additions ISO so it doesn't take up space in the finished base box:
sudo rm -rf /home/vagrant/${VBOX_ISO}
