"---------------------------------------------------------------------
" File     : .nvimrc
" Purpose  : config file for nvim
" Revision : 220620
" License  : BSD3
" Author   : smk (sudhanshumohan781@gmail.com)
"---------------------------------------------------------------------

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
    Plug 'gruvbox-community/gruvbox'        " themes
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'               " surrounds 
    Plug 'scrooloose/syntastic'             " syntax
    Plug 'nvim-lua/plenary.nvim'            " libraries lua
    Plug 'nvim-telescope/telescope.nvim'    " fzf based file search
    Plug 'mbbill/undotree'                  " undo tree
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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

" Plugin Telescope

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

