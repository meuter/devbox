#! /bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

mkdir -p /media/cdrom
mount /dev/cdrom/ /media/cdrom
sudo /media/cdrom/VBoxLinuxAdditions.run
umount /media/cdrom
rmdir /media/cdrom

