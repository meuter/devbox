#! /bin/bash -e

# install slim
sudo apt install -y slim

# install additional themes
git clone https://github.com/adi1090x/slim_themes.git /tmp/slim_themes/
sudo mv /tmp/slim_themes/themes/* /usr/share/slim/themes/

# enable autologin for current user
sudo sh -c "echo -e '# autologin\ndefault_user $(whoami)\nautologin yes\n' >> /etc/slim.conf"







