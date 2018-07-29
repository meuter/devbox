#! /bin/bash -ex

# install zsh and make default for current user
sudo apt install zsh wget
sudo usermod -s $(which zsh) $(whoami)

# install oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.config/oh-my-zsh/

# install bullet train theme
wget http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme -P ~/.config/oh-my-zsh/themes/

# update zsh simlink
if [ -f ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc.bak
fi
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
