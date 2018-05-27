#!/usr/bin/env bash

SLEEP=${1:-1}
echo "Sleeping for ${SLEEP} seconds..."
sleep ${SLEEP} 

export PACKER_LOG=activate
export PACKER_LOG_PATH=packer-log.txt

# use this a the version tag
UNIXTIME=$(date +%s)

PACKER_FILE=${1:-packer.json}

packer validate ${PACKER_FILE}

packer build --parallel=false --force ${PACKER_FILE}

#packer build --force --only vmware-vmx ${PACKER_FILE}
vagrant box add --clean --force --name bionic-xubuntu --provider vmware_desktop vagrant/xubuntu-bionic-vmware.box

#packer build --force --only virtualbox-ovf ${PACKER_FILE}
#vagrant box add --clean --force --name bionic-xubuntu --provider virtualbox vagrant/xubuntu-bionic-virtualbox.box


vagrant box list
ls -alh vagrant
