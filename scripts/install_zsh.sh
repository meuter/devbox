#! /bin/bash -e

# install zsh and make default for current user
sudo apt-get install zsh wget
sudo usermod -s $(which zsh) $(whoami)

# install oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.config/oh-my-zsh/

# install bullet train theme
wget http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme -P ~/.config/oh-my-zsh/themes/

# update zsh simlink
if [ -f ~/.zshrc ]; then
  cp ~/.zshrc ~/.zshrc.bak
  rm -f ~/.zshrc
fi
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
