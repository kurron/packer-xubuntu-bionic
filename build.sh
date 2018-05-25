#!/usr/bin/env bash

export PACKER_LOG=activate
export PACKER_LOG_PATH=packer-log.txt

# use this a the version tag
UNIXTIME=$(date +%s)

PACKER_FILE=${1:-packer.json}

packer validate ${PACKER_FILE}
#packer build --force --only vmware-vmx ${PACKER_FILE}
packer build --parallel=false --force ${PACKER_FILE}
vagrant box add --clean --force --name bionic-xubuntu vagrant/bionic-xubuntu.box
vagrant box list
