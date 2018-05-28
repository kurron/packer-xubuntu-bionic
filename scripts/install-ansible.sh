#!/usr/bin/env bash

# there are numerous ways to install Ansible but let's use the package manager
echo "Installing Ansible via package manager..."

# maybe this will help avoid the APT lock issues?
sudo systemctl stop apt-daily.timer

# I've had issues with something grabbing the APT lock so we check at each step now
until sudo apt-get --yes update; do echo "Waiting for apt lock"; sleep 5; done
sudo apt-get update
sudo apt-get --yes install software-properties-common

echo Adding Ansible PPA
sudo apt-add-repository ppa:ansible/ansible

until sudo apt-get --yes update; do echo "Waiting for apt lock"; sleep 5; done
echo "Who owns the lock?"
sudo lsof /var/lib/dpkg/lock
sudo apt-get update
sudo apt-get --yes install ansible

ansible --version
