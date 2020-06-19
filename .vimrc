set encoding=utf-8
scriptencoding utf-8
set clipboard=unnamedplus  " system clipboard
set hidden              " hide buffers instead of closing them
set noerrorbells
set nobackup
set noswapfile
set backspace=indent,eol,start
set incsearch
set ignorecase
set smartcase
set nu rnu
set lazyredraw
set updatetime=300      " Longer update times (default is 4000ms) leads to delays and poor ux
set cmdheight=2         " Give more space for displaying messages

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undo')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
    set undodir=$HOME/.vim/undo
    set undolevels=1000
    set undoreload=10000
endif

" Stop automatic commenting when writing before or after a comment line
augroup Format-Options
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" Switch between relative line numbers and absolute when going in/out of insert mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set rnu
  autocmd BufLeave,FocusLost,InsertEnter   * set rnu!
augroup END

" Use Space as leader
let g:mapleader = "\<Space>""
let g:maplocalleader = "\<Space>"

" Search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Intuitive split directions for buffers
set splitbelow
set splitright

" Easy split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Easier buffer navigation
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>

" Intuitive split binds for buffers
nnoremap <C-w><BS> <C-w>s
nnoremap <C-w>\  <C-w>v

" Tmux like close split
map <C-w>x <C-w>q

" I mess these up when going fast
command WQ wq
command Wq wq
command W w
command Q q

" Download vim-plug if it doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Coc extensions
let g:coc_global_extensions = [
    \ 'coc-ultisnips',
    \ 'coc-json',
    \ 'coc-python',
    \ 'coc-pairs',
    \ 'coc-vimtex'
\ ]

" PLugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
" Theming
Plug 'junegunn/goyo.vim'
Plug 'itchyny/lightline.vim'
Plug 'dylanaraps/wal.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'ryanoasis/vim-devicons'
" Completion and syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Editing and usability
Plug 'matze/vim-move'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'gcmt/wildfire.vim'
Plug 'majutsushi/tagbar'
Plug 'derekwyatt/vim-fswitch'
Plug 'Yggdroot/indentLine'
Plug 'preservim/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'psliwka/vim-smoothie'
Plug 'markonm/traces.vim'
" Git for vim
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" File browsing
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
" Latex and Markdown
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Disabled -- not used
" Plug 'sjl/gundo.vim'
" manually installed its updates are huge
" Plug '~/.vim/plugged/YouCompleteMe'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Need to be called after plugins are loaded
colorscheme wal

" YouCompleteMe config 
" clangd path wasn't found, would need to fix this
" let g:ycm_clangd_binary_path = "~/Programs/clangd"

" vim-move config
" see https://github/com/matze/vim-move/issues/15 for ESC fix if needed
let c='a'
while c <= 'z'
	exec "set <A-".c.">=\e".c
	exec "imap \e".c." <A-".c.">"
	let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50

" Ultisnips trigger config
"  - Expand turned off because coc is used for snippets
"  - ctrl-j to go to next tabstop
"  - ctrl-k to go to previous tabstop
let g:UltiSnipsExpandTrigger = '<nop>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" tagbar config
nmap <F8> :TagbarToggle<CR>

" Fugitive
nmap gs :vertical Gstatus<CR>

" Nerdtree config
map <F5> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists ("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Binds to make it behave more like ranger
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▶'
let g:NERDTreeDirArrowCollapsible = '▼'
let g:NERDTreeMapOpenSplit='<BS>'
let g:NERDTreeMapOpenVSplit='\'
let g:NERDTreeMapActivateNode='l'
" Patch for Nerdtree to work with startify
let NERDTreeHijackNetrw = 0

" IndentLine config
set expandtab
set tabstop=4
set shiftwidth=4
let g:indentLine_color_term = 239
let g:indentLine_char = '|'

" Nerdcommenter config
filetype plugin on

" Goyo config
nnoremap <F1> :Goyo<CR>
let g:goyo_width = 120
let g:goyo_height = 85

" Lightline config
set laststatus=2
set noshowmode
let g:lightline = {
    \ 'active': {
    \     'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'tabline': {
    \     'left': [ ['buffers'] ],
    \     'right': [ ['close'] ]
    \ },
    \ 'component_expand': {
    \     'buffers': 'lightline#bufferline#buffers'
    \ },
    \ 'component_type': {
    \     'buffers': 'tabsel'
    \ },
    \ 'component_function': {
    \     'gitbranch': 'FugitiveHead'
    \ },
\ }
if has ('gui_running')
    set guioptions-=e
endif

" vim-startify config
" Patch to work with Goyo
autocmd BufEnter *
    \ if !exists('t:startify_new_tab') && empty(expand('%')) && !exists('t:goyo_master') | 
    \   let t:startify_new_tab = 1 |
    \   Startify |
    \ endif

" fswitch config
augroup mycppfiles
    au!
    au BufEnter *.cpp let b:fswitchdst = 'h,hpp' | let b:fswitchlocs = 'reg:|Private|Public/**|'
    au BufEnter *.h let b:fswitchdst = 'cpp,cxx,C' | let b:fswitchlocs = 'reg:|Public|Private/**|'
augroup END
nmap <silent> <Leader>of :FSHere<cr>
nmap <silent> <Leader>ol :FSRight<cr>
nmap <silent> <Leader>oL :FSSplitRight<cr>
nmap <silent> <Leader>oh :FSLeft<cr>
nmap <silent> <Leader>oH :FSSplitLeft<cr>
nmap <silent> <Leader>ok :FSAbove<cr>
nmap <silent> <Leader>oK :FSSplitAbove<cr>
nmap <silent> <Leader>oj :FSBelow<cr>
nmap <silent> <Leader>oJ :FSSplitBelow<cr>

" Markdown preview config
nmap <C-p> <Plug>MarkdownPreviewToggle

" vimtex config
let g:vimtex_view_method = 'zathura'
