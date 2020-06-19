# Installed plugins
### Theming
* goyo - focus mode - https://github.com/junegunn/goyo.vim
* wal.vim - sets the pywal theme on vim https://github.com/dylanaraps/wal.vim
* lightline - adds a fancier bar at the bottom https://github.com/itchyny/lightline.vim
* vim-devicons - adds icons from Nerd Fonts https://github.com/ryanoasis/vim-devicons
### Completion & Syntax
* coc - completions for languages!
    * coc-ultisnips
    * coc-json
    * coc-python
    * coc-pairs
### Editing and Usability
* vim-plug - plugin manager https://github.com/junegunn/vim-plug
* ultisnips - ultimate snippet solution https://github.com/SirVer/ultisnips
* vim-move - moves selections up and down https://github.com/matze/vim-move
* vim-endwise - autocompletes structures like if...endif https://github.com/tpope/vim-endwise
* wildfire - quick select inner text objects https://github.com/gcmt/wildfire.vim
* tagbar - tags on the go https://github.com/majutsushi/tagbar
* indentLine - adds | to visualize indents https://github.com/Yggdroot/indentLine
* nerdcommenter - commenting everything https://github.com/preservim/nerdcommenter
* vim-tmux-navigator - seamless jumping between vim panes and tmux splits https://github.com/christoomey/vim-tmux-navigator
* vim-fswitch - switches between related .h and .ccp files https://github.com/derekwyatt/vim-fswitch
* vim-smoothie - smooth scrolling https://github.com/psliwka/vim-smoothie
* vim-eunuch - :SudoWrite, :Rename and other command line commands in Vim https://github.com/tpope/vim-eunuch
* vim-repeat - repeats certain plugin commands https://github.com/tpope/vim-repeat
* traces.vim - highlights substitution text https://github.com/markonm/traces.vim
### Git for Vim
* vim-gitgutter - shows file changes for git https://github.com/airblade/vim-gitgutter
* vim-fugitive - git directly inside the vim file https://github.com/tpope/vim-fugitive
### File Browsing
* nerdtree - visual file hierarchy https://github.com/preservim/nerdtree
* vim-startify - start page and maintains sessions https://github.com/mhinz/vim-startify
### Latex & Markdown
* vimtex - latex in vim https://github.com/lervag/vimtex
* markdown-preview.nvim - markdown live preview in browser https://github.com/iamcco/markdown-preview.nvim

## Needs setup/fixing
* lightline-bufferline - supposed to add buffer info to the bottom bar https://github.com/mengelbrecht/lightline-bufferline

## Later...
* Clewn - debugging through gdb http://clewn.sourceforge.net/
* Syntastic - syntax checking pre-compile https://github.com/vim-syntastic/syntastic
* ctrlp.vim - fuzzy file, buffer, mru, tag search https://github.com/ctrlpvim/ctrlp.vim
    * alternative: fzf.vim
* ctrsf - fast search and edit (should use with vim-multiline) https://github.com/dyng/ctrlsf.vim
* minibufexpl.vim - mark buffers like in GUI editors (doesn't konsole do this?) https://github.com/fholgado/minibufexpl.vim

## Disabled
* gundo - visualize undo tree https://docs.stevelosh.com/gundo.vim/
* YouCompleteMe - code completion https://github.com/ycm-core/YouCompleteMe
    * doesn't work with Unreal - would take more time to implement

# Hotkeys
#### Toggle NerdTree
- \<F5>

#### Turn on Markdown Preview
- \<Ctrl-p>

#### Toggle Goyo Focus Mode
- \<F1> 

#### Toggle Tagbar 
- \<F8> 

#### Wildfire select text objects
- \<Enter>

#### vimtex toggle autocompile on/off
* \<LocalLeader>ll

#### fswitch between .cpp and .h files
* \<Leader>of :FSHere
* \<Leader>ol :FSRight
* \<Leader>oL :FSSplitRight
* \<Leader>oh :FSLeft
* \<Leader>oH :FSSplitLeft
* \<Leader>ok :FSAbove
* \<Leader>oK :FSSplitAbove
* \<Leader>oj :FSBelow
* \<Leader>oJ :FSSplitBelow

#### Search visually selected text
* {VISUAL-SELECT} // {n N}

#### Swap buffer positions
* \<C-w> x

#### Swap current buffer
* \<Tab> or \<S-Tab>
