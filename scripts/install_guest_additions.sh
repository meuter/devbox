#! /bin/bash -e

sudo apt install -y dkms build-essential linux-headers-generic linux-headers-$(uname -r) 

sudo mkdir -p /media/cdrom
sudo mount /dev/cdrom /media/cdrom
sudo /media/cdrom/VBoxLinuxAdditions.run && true
sudo umount /media/cdrom
sudo rmdir /media/cdrom

