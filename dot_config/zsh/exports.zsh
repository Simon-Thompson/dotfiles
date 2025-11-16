#!/bin/sh
# HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="nvim"
export TERMINAL="kitty"
# export BROWSER="firefox"
export PATH="$HOME/.local/bin":$PATH
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export PATH="$HOME/.local/share/neovim/bin":$PATH
export XDG_CURRENT_DESKTOP="Wayland"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1
export HYPRSHOT_DIR="/tmp/"
export XDG_PICTURES_DIR="$HOME/Pictures/Screenshots"
export ZELLIJ_AUTO_ATTACH=true
export ZELLIJ_AUTO_EXIT=true
eval "$(zoxide init zsh)"
# eval "`pip completion --zsh`"
