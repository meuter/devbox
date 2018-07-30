#! /bin/bash -e

source ./colors.sh

info "Detecting Virtual Box Guest Addition CD..."

# create mount point for guest addition
sudo mkdir -p /media/additions

missing_guest_additions() {
	error "Please insert VBox Guest Addition CD image and retry"
	info 
	info  "'Devices' >>> 'Insert Guest Additions CD image...'"
	info
	exit -1
}

# detect if cdrom can be mounted and mount it
mounted=$(sudo sh -c "if mount /dev/cdrom /media/additions; then echo yes; else echo no; fi")
if [ "$mounted" == "no" ]; then
       	error "No CD available..."
	missing_guest_additions 
fi

# detect if mounted cd is actually guest addition
if [ ! -f /media/additions/VBoxLinuxAdditions.run ]; then 
	error "Inserted CD is the right one..."
	sudo umount /media/additions
	missing_guest_additions 
fi

sudo umount /media/additions

info "Done!"

