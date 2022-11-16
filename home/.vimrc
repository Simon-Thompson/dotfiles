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
set tags=./tags,tags;$HOME " Search for tags in current dir, then up till Home
"if exists('+termguicolors')
  "let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  "let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  "set termguicolors
"endif

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
nnoremap <C-c> :bp\|bd#<CR>

" Intuitive split binds for buffers
nnoremap <C-w><BS> <C-w>s
nnoremap <C-w>\  <C-w>v

" Tmux like close split
map <C-w>x <C-w>q

" Intuitive back and forward jump
nnoremap gb <C-o>
nnoremap gf <C-i>

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

" PLugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
" Theming
"Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'dylanaraps/wal.vim'
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'liuchengxu/eleline.vim'
" Completion and syntax
Plug 'lifepillar/vim-mucomplete'
Plug 'xavierd/clang_complete'
Plug 'editorconfig/editorconfig-vim'
" Editing and usability
Plug 'matze/vim-move'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'gcmt/wildfire.vim'
Plug 'derekwyatt/vim-fswitch'
Plug 'Yggdroot/indentLine'
Plug 'preservim/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'psliwka/vim-smoothie'
Plug 'markonm/traces.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'airblade/vim-rooter'
Plug 'justinmk/vim-sneak'
" Git for vim
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" File browsing
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
" Latex and Markdown
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Need to be called after plugins are loaded
colorscheme wal
hi Normal ctermbg=NONE guibg=NONE

" vim-move config
" see https://github.com/matze/vim-move/issues/15 for ESC fix if needed
let c='a'
while c <= 'z'
	exec "set <A-".c.">=\e".c
	exec "imap \e".c." <A-".c.">"
	let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50

" Ultisnips trigger config
""let g:UltiSnipsExpandTrigger = '<C-f>' " don't collide with MUcomplete
""let g:UltiSnipsJumpForwardTrigger = '<C-f>' " don't collide with MUcomplete
"let g:UltiSnipsJumpBackwardTrigger = '<C-b>'
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" Fugitive
nmap gs :vertical Gstatus<CR>

" Nerdtree config
map <F5> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=60
autocmd bufenter * if (winnr("$") == 1 && exists ("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Binds to make it behave more like ranger
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
let g:goyo_width = 180
let g:goyo_height = 85
" keep transparency on exit
function! s:goyo_leave()
         hi Normal guibg=NONE ctermbg=NONE
endfunction
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" eleline config
set laststatus=2
let g:eleline_powerline_fonts=1

" vim-startify config
nnoremap <leader>ss :SSave<CR>
nnoremap <leader>sx :SClose<CR>
nnoremap <leader>sd :SDelete<CR>
let g:startify_files_number = 18
let g:startify_session_persistence = 1
let g:startify_lists = [
    \ { 'type': 'sessions',     'header': ['Saved sessions'] },
    \ { 'type': 'dir',          'header': ['Recent files'] },
    \ ]
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
let g:vimtex_compiler_engine = 'lualatex'
noremap <Leader>lf :let &cole=(&cole == 2) ? 0 : 2 <bar> echo 'conceallevel ' . &cole <CR>
" Disable overfull/underfull \hbox and all package warnings
let g:vimtex_quickfix_latexlog = {
      \ 'overfull' : 0,
      \ 'underfull' : 0,
      \ 'packages' : {
      \   'default' : 0,
      \ },
      \}
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : 'build',
    \}

" editorconfig config
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" WhichKey config
nnoremap <silent> <leader>  :<c-u>WhichKey '<Space>'<CR>

" Fzf config
nnoremap <leader>ff :Files<Cr>
nnoremap <leader>fg :Rg<Cr>
nnoremap <leader>fb :Buffers<Cr>

" vim-rooter config
let g:rooter_targets='*.h,*.cpp'
let g:rooter_patterns=['Source/']

" vim-sneak config
"let g:sneak#label=1

" vim-peekaboo
let g:peekaboo_ins_prefix='<c-x>' " need to hit <c-x><c-r> to see registers

" MUcomplete config
set completeopt-=preview
set completeopt+=menuone,noselect
set shortmess+=c
let g:mucomplete#enable_auto_at_startup=1
imap <expr> <down> mucomplete#extend_fwd("\<down>")

" clang-complete config
let g:clang_library_path='/usr/lib64/libclang.so'
let g:clang_complete_auto=1
