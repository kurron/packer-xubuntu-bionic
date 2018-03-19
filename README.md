# Overview
This project creates an Xubuntu 18.04 box with software development tools installed.

# Prerequisites
* a working [Packer](https://www.packer.io/) installation
* a working [Vagrant](https://www.vagrantup.com/) installation

## Existing Bare Bones Box Requirement

# Building
Type `./build.sh` to build the server box.

# Installation
The scripts will automatically install the newly built box into Vagrant's cache and publish it to Hashicorp's Atlas.

# Tips and Tricks

## Testing The Box
`vagrant up` will launch the server VM.
Once you are satisfied that the box built correctly, use `vagrant destroy` to remove it.

# Troubleshooting

# License and Credits
This project is licensed under the [Apache License Version 2.0, January 2004](http://www.apache.org/licenses/).
