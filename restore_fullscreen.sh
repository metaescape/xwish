#!/usr/bin/env bash
. ~/myconf/xwish/utils.sh
is_active_window_full_screen
if [ $? == 0 ]; then
    wmctrl -r ':ACTIVE:' -b toggle,fullscreen
fi
