# Installed plugins
### Theming
- dracula OR wal
- goyo - focus mode - https://github.com/junegunn/goyo.vim
- wal.vim - sets the pywal theme on vim https://github.com/dylanaraps/wal.vim
- vim-devicons - adds icons from Nerd Fonts https://github.com/ryanoasis/vim-devicons
- eleline.vim - status bar with support for most of my plugins https://github.com/liuchengxu/eleline.vim
### Completion & Syntax
- MUcomplete - minimalist, configurable autocompletion https://github.com/lifepillar/vim-mucomplete
- clang-complete - c++ completion https://github.com/xavierd/clang_complete
- editorconfig - configures vim from a .editorconfig file. See https://github.com/editorconfig/editorconfig-vim and https://editorconfig.org/ for more

### Editing and Usability
- vim-plug - plugin manager https://github.com/junegunn/vim-plug
- ultisnips - ultimate snippet solution https://github.com/SirVer/ultisnips
- vim-move - moves selections up and down https://github.com/matze/vim-move
- vim-endwise - autocompletes structures like if...endif https://github.com/tpope/vim-endwise
- wildfire - quick select inner text objects https://github.com/gcmt/wildfire.vim
- nerdcommenter - commenting everything https://github.com/preservim/nerdcommenter
- vim-tmux-navigator - seamless jumping between vim panes and tmux splits https://github.com/christoomey/vim-tmux-navigator
- vim-fswitch - switches between related .h and .ccp files https://github.com/derekwyatt/vim-fswitch
- vim-smoothie - smooth scrolling https://github.com/psliwka/vim-smoothie
- vim-eunuch - :SudoWrite, :Rename and other command line commands in Vim https://github.com/tpope/vim-eunuch
- vim-repeat - repeats certain plugin commands https://github.com/tpope/vim-repeat
- traces.vim - highlights substitution text https://github.com/markonm/traces.vim
- vim-peekaboo - shows registers in side preview when hiting " or @ https://github.com/junegunn/vim-peekaboo
- WhickKey - visual helper showing commands after hitting a starting key https://github.com/liuchengxu/vim-which-key/
- vim-rooter - auto change the working directory to the project root https://github.com/airblade/vim-rooter
- vim-sneak - jump to matching 2-letter term https://github.com/justinmk/vim-sneak
### Git for Vim
- vim-fugitive - git directly inside the vim file https://github.com/tpope/vim-fugitive
- vim-gitgutter - shows file changes for git https://github.com/airblade/vim-gitgutter
### File Browsing
- vim-startify - start page and maintains sessions https://github.com/mhinz/vim-startify
- nnn - file browser with plugin power https://github.com/mcchrish/nnn.vim
### Latex & Markdown
- vimtex - latex in vim https://github.com/lervag/vimtex
- markdown-preview.nvim - markdown live preview in browser https://github.com/iamcco/markdown-preview.nvim

## Needs setup/fixing

## Later...
- Clewn - debugging through gdb http://clewn.sourceforge.net/
- Syntastic - syntax checking pre-compile https://github.com/vim-syntastic/syntastic
- ctrsf - fast search and edit (should use with vim-multiline) https://github.com/dyng/ctrlsf.vim
- minibufexpl.vim - mark buffers like in GUI editors (doesn't konsole do this?) https://github.com/fholgado/minibufexpl.vim

## Disabled

# Hotkeys / Reminders

#### Startify session commands
- \<leader>ss (:SSave save current session)
- \<leader>sx (:SClose close current session)

#### Generate new tags file for project:
(From the command line)
- ctags -R -f ./.git/tags .

#### Open nnn
- \<leader>n

#### Turn on Markdown Preview
- \<Ctrl-p>

#### Toggle Goyo Focus Mode
- \<F1> 

#### Toggle Tagbar 
- \<F8> 

#### Wildfire select text objects
- \<Enter>

#### vimtex toggle autocompile on/off
- \<LocalLeader>ll

#### fswitch between .cpp and .h files
- \<Leader>of :FSHere
- \<Leader>ol :FSRight
- \<Leader>oL :FSSplitRight
- \<Leader>oh :FSLeft
- \<Leader>oH :FSSplitLeft
- \<Leader>ok :FSAbove
- \<Leader>oK :FSSplitAbove
- \<Leader>oj :FSBelow
- \<Leader>oJ :FSSplitBelow

#### Search visually selected text
- {VISUAL-SELECT} // {n N}

#### Swap buffer positions
- \<C-w> x

#### Swap current buffer
- \<Tab> or \<S-Tab>
