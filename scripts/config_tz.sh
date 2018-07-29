#! /bin/bash -ex

tz=${1:-$(tzselect)}

# setup timezone & ntp
sudo timedatectl set-timezone $tz
sudo timedatectl set-ntp on
