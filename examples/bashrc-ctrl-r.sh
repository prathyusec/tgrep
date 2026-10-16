#!/usr/bin/env bash
# Add this to the bottom of your ~/.bashrc to make Ctrl+R open tgrep
# instead of the default reverse-i-search.

_tgrep_ctrlr() {
    local cmd
    cmd=$(tgrep) || { READLINE_LINE=""; READLINE_POINT=0; return; }
    READLINE_LINE="$cmd"
    READLINE_POINT=${#cmd}
}
bind -x '"\C-r": _tgrep_ctrlr'
