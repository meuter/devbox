#! /bin/bash -e

# NOTE(cme): this script assumes and will enforce that all workspace names will be prefixed by their number
#            (e.g. "1:vim", "2:something else")

workspace_number=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).num' | cut -d"\"" -f2)
workspace_prefixed_name=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name' | cut -d"\"" -f2)
workspace_name=$(echo $workspace_prefixed_name | awk '{split($0, res, ":"); print res[2]}')
workspace_new_name=$(zenity --entry --entry-text "$workspace_name" --text "Rename Workspace $workspace_number")
workspace_new_prefixed_name=$workspace_number:$workspace_new_name

i3-msg "rename workspace \"$workspace_prefixed_name\" to \"$workspace_new_prefixed_name\""

