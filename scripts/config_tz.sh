#! /bin/bash -ex

# setup timezone & ntp
sudo timedatectl set-timezone $(tzselect)
sudo timedatectl set-ntp on
