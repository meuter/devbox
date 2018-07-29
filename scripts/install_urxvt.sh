#! /bin/bash -ex

sudo apt install -y rxvt-unicode x11-xserver-utils

echo '#include ".devbox/Xresources/colors"' >> ~/.Xresources
echo '#include ".devbox/Xresources/rxvt-unicode"' >> ~/.Xresources
