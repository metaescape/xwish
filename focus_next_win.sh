#!/usr/bin/env bash
. ~/myconf/xwish/utils.sh

if [ $(get_ids_in_current_workspace | wc -w) == "1" ]; then
    if [[ $(get_active_win_name) =~ "emacs" ]]; then
        xdotool key --clearmodifiers ctrl+x o
    fi
else
    focus_next_win_in_workspace
fi
