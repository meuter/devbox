# Custom Devbox:

Custom development box mainly for C/C++ and python.

| Component        | Choice |
| ---------------- | ------ | 
| Distro           | [Ubuntu 18.04.01 server](https://www.ubuntu.com/download/server) |
| Desktop          | [i3-gaps](https://github.com/Airblader/i3) with [bumblebee-status](https://github.com/tobi-wan-kenobi/bumblebee-status) and custom config |
| Launcher         | [rofi](https://github.com/DaveDavenport/rofi) |
| Terminal         | [rxvt-unicode](https://wiki.archlinux.org/index.php/rxvt-unicode) with custom config |
| Dev. Editor      | [Visual Studio Code](https://code.visualstudio.com/) with some custom extensions |
| Browser          | [Google Chrome](https://www.google.com/chrome/) |
| Shell            | [oh-my-zsh](https://ohmyz.sh/) with [bullet-train](https://github.com/caiogondim/bullet-train.zsh) |
| Display Manager  | [slim](https://wiki.archlinux.org/index.php/SLiM) with some [custom themes](https://github.com/adi1090x/slim_themes) |
| File Manager     | [Thunar](https://wiki.archlinux.org/index.php/thunar) |
| GTK Theme        | [Arc-Dark](https://github.com/horst3180/arc-theme) |
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
    git clone https://github.com/meuter/devbox ~/.devbox/
    cd ~/.devbox/scripts/install_vm_bionic.sh
    ```

    (will ask you to select the tz, and type in you samba password)
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
| alt+enter    | open terminal |
| ctrl+alt+c   | edit devbox |

## SSH into the box:

```
ssh 192.168.56.100
```

## Mounting home to windows host:

In Windows Explorer, go to "Computer> Map Network Drive..." and use the following address:

    ```
    "\\192.168.1.100\<username>"
    ```
## Screenshots

### Empty desktop
![screenshot1.png](/screenshots/screenshot1.png?raw=true)

### Some applications open
![screenshot2.png](/screenshots/screenshot2.png?raw=true)

