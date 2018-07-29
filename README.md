# Custom Ubuntu Flavor:

| Component        | Choice|
| ---------------- | ----- | 
| Distro           | Ubuntu 18.04.01 server |
| Desktop          | i3-gaps+rofi |
| Terminal         | rxvt-unicode |
| Dev. Editor      | vscode |
| Browser          | google chrome |
| Shell            | zsh+oh-my-zsh+bullet-train |
| Display Manager  | slim |
| Theme            | arc-darker |
| Extra            | custom configs, autologin |

# Install

1. install virtual box > 5.2
2. download Ubuntu 18.04.01 server iso image
3. create a VM and install 18.04.01
4. run main install script:

```
git clone https://github.com/meuter/dotfiles ~/.dotfiles/
cd ~/.dotfiles/scripts/install_vm_bionic.sh
```

