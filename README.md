# Overview
This project creates an Ubuntu 16.04 box with Xfce and various software development
tools installed.

# Prerequisites
* a working [Packer](https://www.packer.io/) installation
* a working [Vagrant](https://www.vagrantup.com/) installation

## Existing Bare Bones Box Requirement
Packer [currently does not support importing an existing Vagrant box](https://github.com/mitchellh/packer/issues/869) and enhancing it.
The workaround is to reference the previously imported OVA from VirtualBox itself.  The `ovf` variable in the `packer.json` illustrates
how ugly the location is.  The upshot is that box must have been previously been built so this project can enhance it.

# Building
Type `./build.sh` to build the server box.

# Installation
The scripts will automatically install the newly built box into Vagrant's cache
and publish it to Hashicorp's Atlas.

# Tips and Tricks

## Testing The Box
`vagrant up` will launch the server VM.
Once you are satisfied that the box built correctly, use `vagrant destroy` to remove it.

# Troubleshooting

# License and Credits
This project is licensed under the [Apache License Version 2.0, January 2004](http://www.apache.org/licenses/).
