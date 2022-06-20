"---------------------------------------------------------------------
" File     : .nvimrc
" Purpose  : config file for nvim
" Revision : 220620
" License  : BSD3
" Author   : smk (sudhanshumohan781@gmail.com)
"---------------------------------------------------------------------
set nocompatible
syntax on
set noerrorbells visualbell t_vb=
set hidden              " hides the buffer
set mouse+=a            " adds mouse support
set shortmess+=I        " disables startup message

"search restriction
" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

set showmatch
set hlsearch

set encoding=utf-8
" numbering
set number
set relativenumber
" search
set incsearch           " incremental search
set ignorecase          " ignore case of search term
set smartcase           " case sensitive if search term has upper letters
" column restriction
set textwidth=78
set nowrap
set cc=80               " color column
highlight ColorColumn ctermbg=0 guibg=lightgrey
" indentation
" set backspace=ident,eol,start
set tabstop=4           " default tab length
set expandtab           " convert tabs into spaces
set shiftwidth=4        " automatic tabs default length
set softtabstop=4       " cursor movement length on tab
" smart indentation is obsolete, use autoindent
set autoindent
filetype plugin indent on
" open splits panes to right and bottom
set splitright
set splitbelow
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
" remove some mappings
nmap Q <Nop>
" shows status bar below
set laststatus=2
set statusline=%-4m%f\ %y\ \ %=%{&ff}\ \|\ %{&fenc}\ [%l:%c]

" Install vim-plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'    
    Plug 'scrooloose/syntastic'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'mbbill/undotree'

call plug#end()

let mapleader=" "

" Plugin Gruvbox
colorscheme gruvbox
set background=dark

" Plugin Undodir
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Plugin FZF
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <leader>f :Rg<CR>

" Competitive Coding setup
source ~/.config/nvim/cp.vim
