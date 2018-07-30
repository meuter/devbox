# Devbox

This project aims at making it easy to bootstrap my custom development box into
[VirtualBox](https://www.virtualbox.org/wiki/Downloads). The intent here is not
to have a full blown desktop environment, but rather a simple VM that can host a confortable
(at least for me) software development experience (editing, compiling, testing...).
I do mostly C/C++, python, and the occasional javascript and go. Here is a small overview:

| Component        | Choice  | Reason |
| ---------------- | ------- | ------ |
| Distro           | [Ubuntu 18.04.01 server](https://www.ubuntu.com/download/server) | easy to install, well documented, familiar |
| Desktop          | [i3-gaps](https://github.com/Airblader/i3) with [bumblebee-status](https://github.com/tobi-wan-kenobi/bumblebee-status) and custom config | minimalistic, configurable, keyboard based |
| Launcher         | [rofi](https://github.com/DaveDavenport/rofi) | keyboard based, prettier that dmenu |
| Terminal         | [rxvt-unicode](https://wiki.archlinux.org/index.php/rxvt-unicode) with custom config | minimalistic, configurable |
| Dev. Editor      | [Visual Studio Code](https://code.visualstudio.com/) with some custom extensions | user friendly, extensible, multi-language, __not__ vim 😂|
| Browser          | [Google Chrome](https://www.google.com/chrome/) | chrome dev tools |
| Shell            | [oh-my-zsh](https://ohmyz.sh/) with [bullet-train](https://github.com/caiogondim/bullet-train.zsh) | theming, improved tab completion over bash |
| Display Manager  | [slim](https://wiki.archlinux.org/index.php/SLiM) with some [custom themes](https://github.com/adi1090x/slim_themes) | tiny footprint, easy to configure |
| File Manager     | [Thunar](https://wiki.archlinux.org/index.php/thunar) | user friendly, familiar |
| GTK Theme        | [Arc-Dark](https://github.com/horst3180/arc-theme) | pretty |
| Extra            | custom configs, autologin, samba share | familiar |

Thanks to [Luke Smith](https://www.youtube.com/channel/UC2eYFnH61tmytImy1mTYvhA) and [Code Path](https://www.youtube.com/channel/UCcQsDUZiK1GWDcP7BpVO_kw) for inspiring this!

# Install

1. install virtual box (tested with v5.2)
2. download Ubuntu 18.04.01 server iso image
3. create a VM:
    1. At least 2Gb Ram
    2. At least 16Gb Disk
    3. Video memory 128Mb    
    4. Two network adatper: 
        1. NAT - guest can go online
        2. Host-Only (192.168.56.xx) - host only can connect to guest
    5. load the Ubuntu 18.04.01 server iso in the CDROM drive
4. boot the VM and follow the Ubuntu installer's instruction
5. reboot the VM
6. clone the project and run the main install script:
    ```
    git clone --depth=1 https://github.com/meuter/devbox ~/.devbox/
    cd ~/.devbox/scripts/ 
    ./install_dev_box.sh
    ```

   The script will prompt you to select the timezone (for ntp sync), and a little later, 
   it will prompt you to enter and confirm your samba password (to share your home over 
   samba in the guest). The install script will then continue until completion without user interaction. The VM will reboot automatically at the end.
7. Start coding 🤓

# Usage

## i3 Keyboard Shortcut:

| key          | function |
| ------------ | ----- |
| f11 | full screen focussed window |
| alt+\<arrow\> | move focus | 
| alt+shift+\<arrow\> | move window |
| alt+\<num\> | select worspace |
| control+shift+\<arrow\> | select next/prev workspace |
| control+space | rofi show windows |
| F2 exec rofi | rofi run | 
| F3 exec rofi | rofi desktop run |
| alt+pause s  | shutdown |
| alt+pause r  | reboot |
| alt+pause e  | logout |
| alt+enter    | open terminal |
| ctrl+shift+g | open chrome |
| ctrl+shift+o | open vscode |
| ctrl+shift+o | open thunar |
| ctrl+alt+c   | edit devbox |

## Network:

From the guest machine only, you can ssh into the box. The default IP if 192.168.56.100 (see [install_devbox_cme.sh](/scripts/install_devbox_cme.sh) if you want to change this):

```
ssh 192.168.56.100
```

You can also mount your home directory from a Windows host machine. For that, open the file explorer, go to "Computer> Map Network Drive..." and use the following address:

```
\\192.168.1.100\<username>
```

Use your user name with the samba password you entered during installation.

## git alias and shortcuts:

Git is configured with the following git aliase:

| Git Alias | Meaning | Command | Console Alias<sup>(1)</sup> | 
| --------- | ------- | ------- | ------------- |
| diff  | diff against HEAD | diff --no-pager | d |
| wtf   | short status | status -s | w |
| recent | recent change current branch | log -5 --color --pretty=tformat:'%C(yellow)%h%Creset [%><(18)%cr] %C(white)%<(70,trunc)%s%Creset (%cn)' | r | 
| in | incoming commits<sup>(2)</sup> | !git remote update -p; git log --color --pretty=tformat:'%C(yellow)%h%Creset [%><(18)%cr] %Cred%<(70,trunc)%s%Creset (%cn)' ..@{u} | i | 
| out | outgoing commits<sup>(2)</sup> | log --color --pretty=tformat:'%C(yellow)%h%Creset [%><(18)%cr] %Cred%<(70,trunc)%s%Creset (%cn)' @{u}.. | o | 
| lol   | pretty log current branch | log --decorate --pretty=oneline --abbrev-commit --color | l |
| lolg  | pretty log all branches | log --graph --decorate --pretty=oneline --abbrev-commit --all --color | 
| update | update workspace | !git stash; git pull --rebase; git stash pop | 
| wipe | go back to HEAD | !git reset --hard HEAD; git clean -fd | 
| progress | add currently tracked changes to last commit | commit -a --amend --reuse-message HEAD" |
| meld | compare using meld | difftool -d<sup>(3)</sup>
| review | review incoming changes without merging them | "!git remote update -p; git difftool -d @{u}" |

#### __Notes__:
- __(1)__ you can type this in the terminal instead of "git \<alias\>"
- __(2)__ needs the current branch to track some remote branch
- __(3)__ meld is configured as the default git difftool.

## Screenshots

### Login Screen
![screenshot0.jpg](/screenshots/screenshot0.jpg?raw=true)

### Empty desktop
![screenshot1.jpg](/screenshots/screenshot1.jpg?raw=true)

### Some applications open
![screenshot2.jpg](/screenshots/screenshot2.jpg?raw=true)

