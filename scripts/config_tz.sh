#! /bin/bash -ex

./config_sources_list.sh
./config_tz.sh

# setup timezone & ntp
#! /bin/bash -ex
sudo timedatectl set-timezone $(tzselect)
sudo timedatectl set-ntp on
