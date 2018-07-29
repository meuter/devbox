#! /bin/bash

# install zsh and make default for current user
sudo apt-get install zsh wget
sudo usermod -s $(which zsh) $(whoami)

# install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# install bullet train theme
wget http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme -P ~/.oh-my-zsh/custom/themes/

# update zsh simlink
if [ -f ~/.zshrc ]; then
  cp ~/.zshrc ~/.zshrc.bak
  rm -f ~/.zshrc
fi
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
