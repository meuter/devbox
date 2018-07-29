#! /bin/bash

read -p "Click 'Device> Install Guest Additions...' in VirtualBox (return=done)?" 

sudo mkdir -p /media/cdrom
sudo mount /dev/cdrom /media/cdrom
sudo /media/cdrom/VBoxLinuxAdditions.run
sudo umount /media/cdrom
sudo rmdir /media/cdrom

