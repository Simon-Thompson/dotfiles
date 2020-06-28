# Exports
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export KEYTIMEOUT=2
export PATH="/home/vacuum/.local/bin:$PATH"
# Import colorscheme from 'wal'
(cat "$HOME/.cache/wal/sequences" &)

## Setup vi mode
bindkey -v

## Plugins
source "${HOME}/.config/zsh/antigen.zsh"
antigen use oh-my-zsh
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle mafredri/zsh-async
antigen theme hohmannr/bubblified 
antigen bundle jump
antigen apply

# Sources
source "${HOME}/.config/zsh/aliasrc"
source "${HOME}/.config/zsh/functionrc"
source "${HOME}/.cache/wal/colors.sh"

## Change cursor with support for inside/outside tmux
#function _set_cursor() {
    #if [[ $TMUX = '' ]]; then
      #echo -ne $1
    #else
      #echo -ne "\ePtmux;\e\e$1\e\\"
    #fi
#}

#function _set_block_cursor() { _set_cursor '\e[2 q' }
#function _set_beam_cursor() { _set_cursor '\e[6 q' }

#function zle-keymap-select {
  #if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
      #_set_block_cursor
  #else
      #_set_beam_cursor
  #fi
#}
#zle -N zle-keymap-select
## ensure beam cursor when starting new terminal
#precmd_functions+=(_set_beam_cursor) #
## ensure insert mode and beam cursor when exiting vim
#zle-line-init() { zle -K viins; _set_beam_cursor }

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^h' backward-delete-char

neofetch
echo "$(cat $HOME/todo.md)"
