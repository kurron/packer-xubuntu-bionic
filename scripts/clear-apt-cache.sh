#!/bin/env bash -x

# Packer runs this via sudo

# sometimes the background update process runs and captures the lock
until apt -y update; do echo "Waiting for apt lock"; sleep 5; done

echo 'Clearing APT cache...'
apt-get clean
