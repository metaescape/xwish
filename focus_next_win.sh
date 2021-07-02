#!/usr/bin/env bash
. ~/myconf/xwish/utils.sh
if [ "$1" == "fade" ]; then # make unfocused window transparent
    transset --dec 0.1 -a 
fi

focus_next_win_in_workspace
if [ "$1" == 'hightlight' ]; then # focus then hightlight(blink)
  transset --dec 0.2 -a  # transparent
  sleep 0.3
  transset --inc 1 -a # solid
fi

if [ "$1" == "fade" ]; then
    transset --inc 1 -a 
fi
