#!/bin/bash -x

until sudo apt -y update; do echo "Waiting for apt lock"; sleep 5; done

sudo apt install -y python-pip python-dev build-essential libssl-dev libffi-dev apt-transport-https
sudo pip install --upgrade pip
sudo pip install --upgrade ansible
sudo pip install --upgrade setuptools
