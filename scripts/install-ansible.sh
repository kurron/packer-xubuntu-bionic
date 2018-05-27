#!/usr/bin/env bash

# there are numerous ways to install Ansible but let's use the package manager
echo "Installing Ansible via package manager..."

until sudo apt-get --yes update; do echo "Waiting for apt lock"; sleep 5; done

sudo apt-get update
sudo apt-get --yes install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
until sudo apt-get --yes update; do echo "Waiting for apt lock"; sleep 5; done
sudo apt-get update
sudo apt-get --yes install ansible

ansible --version
