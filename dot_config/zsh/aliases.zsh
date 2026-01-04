#!/bin/sh
alias vim="nvim"
alias todo="nvim ~/todo.md"
alias fetch="fastfetch"
alias sound="pulsemixer"

alias update="arch-update"
alias timeshift="sudo -E timeshift-gtk"
alias bottles="flatpak run com.usebottles.bottles"

# Encrypt and decrypt
alias decrypt_personal="gocryptfs ~/Projects/Personal_encrypted ~/Projects/Personal"
alias encrypt_personal="fusermount -u ~/Projects/Personal"

# Disk space
alias disk="dysk"
alias space="dysk"
alias diskgui="ncdu"
alias spacegui="ncdu"

alias sysinfo="hyprsysteminfo"
alias systeminfo="hyprsysteminfo"
alias motherboard="cat /sys/devices/virtual/dmi/id/board_{vendor,name,version}"

# Media Server
alias sendMedia="exec ~/Scripts/sendMedia.sh"
alias removeMedia="rm -rf -y ~/Downloads/Media/ToSend/*"
alias remote="/usr/NX/bin/nxplayer"
alias s="kitten ssh"

# Config editing binds
alias cfv="nvim ~/.config/nvim"
alias cfz="nvim ~/.zshrc"
alias cft="nvim ~/.tmux.conf"
alias cfa="nvim ~/.config/zsh/aliases.zsh"
alias cfalacritty="nvim ~/.config/alacritty/alacritty.toml"
alias cfk="nvim ~/.config/kitty/kitty.conf"
alias cfh="nvim ~/.config/hypr/hyprland.conf"

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

# vim quickies
alias gamereviewadd="vim ~/Projects/Notes/Projects/GameReviews/mkdocs.yml ~/Projects/Notes/Projects/GameReviews/docs/index.md ~/Projects/Notes/Projects/GameReviews/docs/scores.md"

# Security
alias scanFiles="sudo clamscan -R"

# Games
alias steam_addnonsteamgame="boilr"

# Shorthand for going up directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
