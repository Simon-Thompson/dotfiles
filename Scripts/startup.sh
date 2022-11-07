#! /bin/sh

# Start apps I like
# Terminal clock
i3-msg 'workspace 2; exec "alacritty -e /bin/zsh -c \"source $HOME/.zshrc; tty-clock -c -t; zsh -i\""'
sleep 1
# Spotify
if ! pgrep -x "spotify" > /dev/null
then
    i3-msg "workspace 5; exec --no-startup-id spotify"
    sleep 1
fi
# Discord
if ! pgrep -x "Discord" > /dev/null
then
    i3-msg "workspace 4; exec --no-startup-id discord"
    sleep 1
fi
# Firefox
if ! pgrep -x "firefox" > /dev/null
then
    i3-msg "workspace 3; exec --no-startup-id firefox"
fi
