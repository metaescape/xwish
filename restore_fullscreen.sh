#!/usr/bin/env bash
. ~/myconf/xwish/utils.sh
get_active_win_id > /tmp/current_win_id
is_active_window_full_screen
if [ $? == 0 ]; then
    wmctrl -r ':ACTIVE:' -b toggle,fullscreen
fi
