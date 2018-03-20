#!/bin/env bash -x

# Packer runs this via sudo

# installing guest additions has always been painful.  With the release of Bionic, it will be baked into the kernel
# so we won't have to do this.
export DEBIAN_FRONTEND=noninteractive

# sometimes the background update process runs and captures the lock
until apt-get -y update; do echo "Waiting for apt lock"; sleep 5; done

# install the guest additions
apt-get install -y virtualbox-guest-dkms virtualbox-guest-x11
