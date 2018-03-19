#!/bin/bash

export PACKER_LOG=activate
#export PACKER_LOG_PATH=/tmp

PACKER_FILE=${1:-packer.json}

#sleep 5h

packer validate ${PACKER_FILE}
packer build --force ${PACKER_FILE}
vagrant box add --clean --force --name xenial-xubuntu vagrant/xenial-xubuntu.box
vagrant box list
