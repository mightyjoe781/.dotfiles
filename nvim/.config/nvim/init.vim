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
    " Plug 'scrooloose/syntastic'             " syntax
    Plug 'nvim-lua/plenary.nvim'            " libraries lua
    " Plenary library based lsp-plugins
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/nvim-cmp'

    " For luasnip users.
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'

    " no idea
    Plug 'onsails/lspkind-nvim'
    Plug 'nvim-lua/lsp_extensions.nvim'

    " Plug 'junnplus/nvim-lsp-setup'
    Plug 'williamboman/nvim-lsp-installer'

    Plug 'nvim-telescope/telescope.nvim'    " fzf based file search
    Plug 'mbbill/undotree'                  " undo tree

    " telescope requirements...
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'

    Plug 'vim-conf-live/vimconflive2021-colorscheme'
    Plug 'flazz/vim-colorschemes'
    Plug 'chriskempson/base16-vim'

    " Neovim Tree shitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
    Plug 'romgrk/nvim-treesitter-context'

call plug#end()

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}


let mapleader=" "

nnoremap <silent> Q <nop>
nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <leader>tt <Plug>PlenaryTestFile
nnoremap <leader>x :silent !chmod +x %<CR>

" Plugin Gruvbox
colorscheme gruvbox
set background=dark

" Plugin Undodir
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
nnoremap <leader>u :UndotreeShow<cr>

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

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

augroup SMK
    autocmd!
    " autocmd BufWritePre *.lua Neoformat
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END

" lua require("smk.lsp")
lua require("lsp")
