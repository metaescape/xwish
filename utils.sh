#!/usr/bin/env bash
get_active_win_name() {
    echo $(xdotool getwindowfocus getwindowname)
}

get_active_win_id() {
    id_dec=$(xdotool getactivewindow)
    # hex
    echo $(printf 0x%08x $id_dec)
}

get_active_workspace_id() {
    # echo $(wmctrl -d | grep '\*' | cut -d ' ' -f1)
    echo $(xdotool get_desktop)
}

get_ids_in_current_workspace() {
    local workspace=$(get_active_workspace_id)
    local ids_in_workspace=$(wmctrl -l | grep "^0x.\{8\}\s\+$workspace " | awk '{print $1}')
    echo $ids_in_workspace
}

_get_next_nonblank_in_string() {
    local ids="$1"
    local idx="$2"
    IFS=' ' read -r -a arr <<< "$ids"
    local len=${#arr[@]}
    for i in "${!arr[@]}"; do
        if [[ "${arr[$i]}" = "${idx}" ]]; then
            j=$(((i + 1) % len))
            echo "${arr[$j]}";
            break
        fi
    done
}

get_next_win_in_workspace() {
    local ids=$(get_ids_in_current_workspace)
    local current_id=$(get_active_win_id)
    echo $(_get_next_nonblank_in_string "$ids" "$current_id")
}

focus_to_win_by_id() {
    wmctrl -ia $1
}

focus_to_win_by_name() {
    wmctrl -a $1
}

focus_next_win_in_workspace() {
    local next=$(get_next_win_in_workspace)
    focus_to_win_by_id "$next"
}
