#!/usr/bin/env bash

PROGNAME=$(basename $0)
error_exit()
{
          echo "${PROGNAME}: ${1:-"Unknown Error"}" 1>&2
          exit 1
}

export VAGRANT_CLOUD_ACCOUNT=XXX
echo ${VAGRANT_CLOUD_ACCOUNT}

SLEEP=${1:-1}
echo "Sleeping for ${SLEEP} seconds..."
sleep ${SLEEP} 

export PACKER_LOG=activate
export PACKER_LOG_PATH=packer-log.txt

# use this a the version tag
UNIXTIME=$(date +%s)

PACKER_FILE=${2:-packer.json}

VALIDATE="packer validate ${PACKER_FILE}"
echo ${VALIDATE}
${VALIDATE} || error_exit "Invalid Packer file."

# build only VMWare
packer build --force --only vmware-vmx ${PACKER_FILE} || error_exit "Unable to build Vagrant box."
vagrant box add --clean --force --name bionic-xubuntu --provider vmware_desktop vagrant/xubuntu-bionic-vmware.box || error_exit "Unable to add Vagrant box."

vagrant box list || error_exit "Unable to list Vagrant boxes."
ls -alh vagrant
