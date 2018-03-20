#!/bin/env bash -x

# Packer runs this via sudo

# Installs one of the pre-packaged desktops
export DEBIAN_FRONTEND=noninteractive

# sometimes the background update process runs and captures the lock
until apt-get -y update; do echo "Waiting for apt lock"; sleep 5; done

# As of Ubuntu 17.10, these are the possible task-based installations to select from:
# kubuntu-live	Kubuntu live CD
# lubuntu-live-gtk	Lubuntu live CD (GTK part)
# ubuntu-budgie-live	Ubuntu Budgie live CD
# ubuntu-live	Ubuntu live CD
# ubuntu-mate-live	Ubuntu MATE Live CD
# ubuntustudio-dvd-live	Ubuntu Studio live DVD
# vanilla-gnome-live	Ubuntu GNOME live CD
# xubuntu-live	Xubuntu live CD
# cloud-image	Ubuntu Cloud Image (instance)
# dns-server	DNS server
# kubuntu-desktop	Kubuntu desktop
# kubuntu-full	Kubuntu full
# lamp-server	LAMP server
# lubuntu-core	Lubuntu minimal installation
# lubuntu-desktop	Lubuntu Desktop
# lubuntu-gtk-core	Lubuntu minimal installation (GTK part)
# lubuntu-gtk-desktop	Lubuntu Desktop (GTK part)
# lubuntu-qt-core	Lubuntu minimal installation (Qt part)
# lubuntu-qt-desktop	Lubuntu Qt Desktop (Qt part)
# mail-server	Mail server
# postgresql-server	PostgreSQL database
# print-server	Print server
# samba-server	Samba file server
# tomcat-server	Tomcat Java server
# ubuntu-budgie-desktop	Ubuntu Budgie desktop
# ubuntu-desktop	Ubuntu desktop
# ubuntu-mate-core	Ubuntu MATE minimal
# ubuntu-mate-desktop	Ubuntu MATE desktop
# ubuntu-usb	Ubuntu desktop USB
# ubuntustudio-audio	Audio recording and editing suite
# ubuntustudio-desktop	Ubuntu Studio desktop
# ubuntustudio-desktop-core	Ubuntu Studio minimal DE installation
# ubuntustudio-fonts	Large selection of font packages
# ubuntustudio-graphics	2D/3D creation and editing suite
# ubuntustudio-photography	Photograph touchup and editing suite
# ubuntustudio-publishing	Publishing applications
# ubuntustudio-video	Video creation and editing suite
# vanilla-gnome-desktop	Vanilla GNOME desktop
# xubuntu-core	Xubuntu minimal installation
# xubuntu-desktop	Xubuntu desktop
# openssh-server	OpenSSH server
# server	Basic Ubuntu server

# install the desktop
echo Installing desktop...
tasksel install xubuntu-core
