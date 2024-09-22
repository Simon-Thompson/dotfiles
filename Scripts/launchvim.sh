#!/usr/bin/env sh

if [ -n "$TMUX" ] ; then
    # tmux session running
    tmux split-window -h "vim \"$*\""
else
    # Remove option --tab for new window
    alacritty --tab -e "vim \"$*\""
fi
