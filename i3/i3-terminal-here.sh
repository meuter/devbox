#!/bin/bash -ex

shell=$(basename $SHELL)
id=$(xdotool getwindowfocus)
focussed_app_pid=$(xprop -id $id | grep PID | awk '{print $3}')
last_child_pid=$(pstree -lpA $focussed_app_pid | tail -n 1 | awk -F"[()]" '{print $2}')
dir=$(readlink "/proc/$last_child_pid/cwd")

term=$(readlink -f /usr/bin/x-terminal-emulator)

if [ "$term" == "/usr/bin/lxterminal" ]; then
    /usr/bin/lxterminal --working-directory=$dir
elif [ "$term" == "/usr/bin/xfce4-terminal.wrapper" ]; then
    /usr/bin/xfce4-terminal --working-directory=$dir
elif [ "$term" == "/usr/bin/urxvt" ]; then
    /usr/bin/urxvt -cd $dir
else
   cd $dir && xterm
fi
