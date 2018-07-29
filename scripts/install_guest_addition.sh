#! /bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run with sudo"
  exit
fi

mkdir -p /media/cdrom
mount /dev/cdrom/ /media/cdrom
/media/cdrom/VBoxLinuxAdditions.run
umount /media/cdrom
rmdir /media/cdrom

