#!/usr/bin/env bash
# use fzf to choose window, press / to swap current focused window to selected window
# press enter or , to go to selected window
 win=$(wmctrl -l | tr -s ' ' | grep -v "select_window\|EmacsAnywhere" |\
     fzf --height 50%  --header ', to swich; / to swap' --expect=/,,)

 [[ -z ${win} ]] && exit;
 echo "$win" | grep '^/' > /dev/null && { #swap
     id=$(echo $win | tail -1 | cut -d ' ' -f2) #second
     i3-msg "[id=$1] swap container with id $id"
     exit;
 } 
 echo "$win" | grep '^,' > /dev/null && { #switch
     id=$(echo $win | tail -1 | cut -d ' ' -f2) #second
     i3-msg [id=$id] focus
 }
# use enter to select 
 id=$(echo $win | tail -1 | cut -d ' ' -f1) #first
 i3-msg [id=$id] focus
