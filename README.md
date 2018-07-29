# Custom Devbox:

| Component        | Choice |
| ---------------- | ------ | 
| Distro           | Ubuntu 18.04.01 server |
| Desktop          | i3-gaps+rofi+bumblebee |
| Terminal         | rxvt-unicode |
| Dev. Editor      | vscode+extensions | |
| Browser          | google chrome |
| Shell            | zsh+oh-my-zsh+bullet-train |
| Display Manager  | slim |
| Theme            | Arc-Dark |
| Extra            | custom configs, autologin, samba share |


# Install

1. install virtual box > 5.2
2. download Ubuntu 18.04.01 server iso image
3. create a VM:
    1. At least 2Gb Ram
    2. At least 16Gb Disk
    3. Video memory 128Mb    
    4. Two network adatper: 
        1. NAT - guest can go online
        2. Host-Only (192.168.56.xx) - host only can connect to guest
5. run main install script and follow instruction
    ```
    git clone https://github.com/meuter/dotfiles ~/.dotfiles/
    cd ~/.dotfiles/scripts/install_vm_bionic.sh
    ```
6. let it reboot

# Usage

## i3 Keyboard Shortcut:

| key          | function |
| ------------ | ----- |
| alt+pause s  | shutdown |
| alt+pause r  | reboot |
| alt+pause e  | logout |
| ctrl+shift+g | open chrome |
| ctrl+shift+o | open vscode |
| alt+enter | open terminal |

## SSH into the box:

```
ssh 192.168.56.100
```

## Mounting home to windows host:

In Windows Explorer, go to "Computer> Map Network Drive..." and use the following address:

    ```
    "\\192.168.1.100\<username>"
    ```

