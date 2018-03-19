#!/bin/bash -x

VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
VBOX_ISO=VBoxGuestAdditions_$VBOX_VERSION.iso
mount -o loop ${VBOX_ISO} /mnt
/mnt/VBoxLinuxAdditions.run
umount /mnt

# Remove the guest additions ISO so it doesn't take up space in the finished base box:
rm -rf /home/vagrant/${VBOX_ISO}

# mount as a CD-ROM device
#mount /dev/cdrom /mnt
#/mnt/VBoxLinuxAdditions.run
#umount /mnt
