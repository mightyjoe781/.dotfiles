"---------------------------------------------------------------------
" File     : .vimrc
" Purpose  : config file for vim
" Revision : 210419
" License  : MIT
" Author   : smk
"---------------------------------------------------------------------
"
" Basic Config

set nocompatible

syntax on
set noerrorbells visualbell t_vb=
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
" incremental search
set incsearch

set textwidth=70 
set colorcolumn=72
highlight ColorColumn ctermbg=0 guibg=lightgrey

set backspace=indent,eol,start
set encoding=utf-8
" Disable the default Vim startup message.
set shortmess+=I

" Show relative line numbers
set number 
set relativenumber

" shows status bar below
set laststatus=2
set statusline=%-4m%f\ %y\ \ %=%{&ff}\ \|\ %{&fenc}\ [%l:%c]

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer
" that isn't shown in any window) that has unsaved changes.  This is
" to prevent you from forgetting about unsaved changes and then
" quitting e.g. via `:qa!`. We find hidden buffers helpful enough to
" disable this protection. See `:help hidden` for more information on
" this.
set hidden

" This setting makes search case-insensitive when all characters in
" the string being searched are lowercase. However, the search becomes
" case-sensitive if it contains any capital letters. This makes searc
" -hing more convenient.
set ignorecase 
set smartcase

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> 

" 'Q' in normal mode enters Ex mode. You almost never want this.

" mouse support enable
set mouse+=a 
filetype plugin indent on " enable file type detection
set autoindent
" open new split panes to right and bottom, which feels more natural
set splitbelow 
set splitright
" remove arrow keys
nnoremap <Left>  :echoe "Use h"<CR> 
nnoremap <Right> :echoe "Use l"<CR> 
nnoremap <Up>    :echoe "Use k"<CR> 
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR> 
inoremap <Right> <ESC>:echoe "Use l"<CR> 
inoremap <Up>    <ESC>:echoe "Use k"<CR> 
inoremap <Down>	 <ESC>:echoe "Use j"<CR>

" quicker window movement
nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k 
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"--------------------------------------------------------------------
" Basic-Config 2

" common typos
command! -bang Q q<bang>
command! -bang W w<bang>

set tags=./tags;/ 
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"---------------------------------------------------------------------
" Plug Config

" if filereadable(expand("$HOME") . "/.vim/plug.vim")
"  source ~/.vim/plug.vim
" endif 

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
" Plug 'vim-utils/vim-man'
" Requires vim built with python 3.7+
" Plug 'lyuts/vim-rtags'
Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'mbbill/undotree'

call plug#end()

colorscheme gruvbox
set background=dark