#!/usr/bin/env bash

function wait_for_apt_lock() {
    until sudo apt-get --yes update; do echo "Waiting for apt lock"; sleep 15; done
}

# there are numerous ways to install Ansible but let's use the package manager
echo "Installing Ansible via package manager..."

# maybe this will help avoid the APT lock issues?
sudo systemctl stop apt-daily.timer

# I've had issues with something grabbing the APT lock so we check at each step now
sleep 1m

wait_for_apt_lock
sudo apt-get update
wait_for_apt_lock
sudo apt-get --yes install software-properties-common

echo Adding Ansible PPA
wait_for_apt_lock
sudo apt-add-repository ppa:ansible/ansible

echo "Who owns the lock?"
sudo lsof /var/lib/dpkg/lock
wait_for_apt_lock
sudo apt-get update
wait_for_apt_lock
sudo apt-get --yes install ansible

ansible --version
