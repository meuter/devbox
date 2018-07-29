#! /bin/bash -e

sudo apt install -y dkms build-essential linux-headers-generic \
                    linux-headers-$(uname -r) virtualbox-guest-additions-iso

sudo mkdir -p /media/cdrom
sudo mount -o loop /usr/share/virtualbox/VBoxGuestAdditions.iso /media/cdrom
sudo /media/cdrom/VBoxLinuxAdditions.run && true
sudo umount /media/cdrom
sudo rmdir /media/cdrom

