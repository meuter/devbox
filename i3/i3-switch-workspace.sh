#! /bin/bash -e

i3-msg -t get_workspaces | jq ".[] | .name" \
                         | sed -E 's/^"(.*)"$/\1/g' \
                         | rofi -dmenu -p "Workspace" \
                         | awk '{split($0,a,":"); print a[1]}' \
                         | xargs i3-msg workspace number
