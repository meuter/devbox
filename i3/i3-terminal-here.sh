#!/bin/bash -ex
id=$(xdotool getwindowfocus)
pid=$(xprop -id $id | grep PID | awk '{print $3}')
term=$(readlink -f /usr/bin/x-terminal-emulator)
dir=$(readlink /proc/$pid/cwd)

# if [ -e "/proc/$pid/cwd" ]
# then
#     dir=$(readlink /proc/$pid/cwd)
#     echo $dir

#     if [ "$term" == "/usr/bin/lxterminal" ]; then
#         /usr/bin/lxterminal --working-directory=$dir
#     elif [ "$term" == "/usr/bin/xfce4-terminal.wrapper" ]; then
#         /usr/bin/xfce4-terminal --working-directory=$dir
#     elif [ "$term" == "/usr/bin/urxvt" ]; then
#         /usr/bin/urxvt -cd $dir
#     else
#        cd $dir && xterm
#     fi
# else
#     i3-sensible-terminal
# fi
