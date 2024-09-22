#!/bin/sh
alias vim="nvim"
alias todo="nvim ~/todo.md"
alias fetch="fastfetch"
alias sound="pulsemixer"

# Media Server
alias sendMedia="exec ~/Scripts/sendMediaToServer.sh"
alias removeMedia="rm -rf -y ~/Downloads/Media/ToSend/*"

# Config editing binds
alias cfv="nvim ~/.config/nvim"
alias cfz="nvim ~/.zshrc"
alias cft="nvim ~/.tmux.conf"
alias cfa="nvim ~/.config/zsh/aliases.zsh"
alias cfalacritty="nvim ~/.config/alacritty/alacritty.toml"

# Reload shell
alias reload="exec $SHELL -l"

# suffix aliases
alias -s txt=nvim
alias -s h=nvim
alias -s cpp=nvim

# Time in terminal with tty
alias time="tty-clock -c -t"

# nnn shortcut
alias nnn="nnn -a -e -c"
alias n3="nnn -a -e -c"
alias n="nnn -aec"

# what's my local ip
alias localip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

# Stuff from machfiles
alias j='z'
alias f='zi'
alias g='lazygit'
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

# systemd
alias list_systemctl="systemctl list-unit-files --state=enabled"

alias ls='ls --color=auto'
