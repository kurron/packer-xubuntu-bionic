#!/usr/bin/env bash

export PACKER_LOG=activate
export PACKER_LOG_PATH=packer-log.txt

PACKER_FILE=${1:-packer.json}

packer validate ${PACKER_FILE}
packer build --force ${PACKER_FILE}
vagrant box add --clean --force --name bionic-xubuntu vagrant/bionic-xubuntu.box
vagrant box list
