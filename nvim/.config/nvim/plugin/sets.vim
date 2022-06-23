set nocompatible
syntax on
set noerrorbells visualbell t_vb=
set guicursor=          " fix cursor behaviour nvim
set hidden              " hides the buffer
set mouse+=a            " adds mouse support
set shortmess+=c        " disables startup message

"search restriction
set showmatch
set nohlsearch          " remove highlight after search

set encoding=utf-8
" numbering
set number
set relativenumber
set nu
" search
set incsearch           " incremental search
set ignorecase          " ignore case of search term
set smartcase           " case sensitive if search term has upper letters
" column restriction
set textwidth=78
set nowrap
set cc=80               " color column
" highlight ColorColumn ctermbg=0 guibg=lightgrey

" set termguicolors

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

set cmdheight=1
set updatetime=50

set scrolloff=8

