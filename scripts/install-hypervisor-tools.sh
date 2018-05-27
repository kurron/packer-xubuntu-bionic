#!/usr/bin/env bash

echo "PACKER_BUILD_NAME is ${PACKER_BUILD_NAME}"
echo "PACKER_BUILDER_TYPE is ${PACKER_BUILDER_TYPE}"
echo "PACKER_HTTP_ADDR is ${PACKER_HTTP_ADDR}"

if [ "${PACKER_BUILDER_TYPE}" == "vmware-vmx" ]
then
    echo "Installing VMWare Tools"
    ISO=/home/vagrant/linux.iso
    sudo mount -o loop ${ISO} /mnt
    ls -alh /mnt
    cp /mnt/VMwareTools-10.2.5-8068393.tar.gz /tmp
    cd /tmp && tar zxvf VMwareTools-10.2.5-8068393.tar.gz && cd vmware-tools-distrib && sudo ./vmware-install.pl -d default
    sudo umount /mnt
    sudo rm -rf /home/vagrant/${ISO}
    until sudo apt-get --yes update; do echo "Waiting for apt lock"; sleep 5; done
    sudo apt-get update
    sudo apt-get --yes install open-vm-tools open-vm-tools-desktop
else
    echo "Installing VirtualBox Guest Additions"
    until sudo apt-get --yes update; do echo "Waiting for apt lock"; sleep 5; done

    sudo apt-get update
    sudo apt-get --yes install gcc make perl

    VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
    VBOX_ISO=VBoxGuestAdditions_$VBOX_VERSION.iso
    sudo mount -o loop ${VBOX_ISO} /mnt
    sudo /mnt/VBoxLinuxAdditions.run
    sudo umount /mnt
    sudo rm -rf /home/vagrant/${VBOX_ISO}
fi

