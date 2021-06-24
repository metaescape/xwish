#!/usr/bin/env bash
. ./utils.sh
focus_next_win_in_workspace
/usr/bin/transset --dec 0.2 -a 
sleep 0.3
/usr/bin/transset --inc 1 -a
