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
" tab characters that are 4-spaces-wide
set tabstop=4 softtabstop=4
" indent to corresponding single tab
set shiftwidth=4
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

" Warns vim on linux/windows to treat <C-v> or <C-shift-v> as paste
" and automatically adjust autoindent accordingly.
" Putting from (clipboard)+ or (selection)* registers don't need this.
set pastetoggle=<f5>

" common typos
command! -bang Q q<bang>
command! -bang W w<bang>

set tags=./tags;/ 
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"---------------------------------------------------------------------
" Plug Config

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')

" Utilities

" Tim-Pope Classics
Plug 'tpope/vim-fugitive'        " Git Wrapper
Plug 'tpope/vim-surround'        " Adds `s` command
Plug 'tpope/vim-commentary'      " Adds comment actions
Plug 'tpope/vim-unimpaired'      " Adds various [ and ] commands
Plug 'tpope/vim-repeat'          " Remap '.' key

Plug 'airblade/vim-gitgutter'    " Git-gutter plugin

Plug 'jremmen/vim-ripgrep'
Plug 'scrooloose/nerdtree'
" original ctrp is not maintained anymore
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
" Requires vim built with python 3.7+
" Plug 'lyuts/vim-rtags'
Plug 'mbbill/undotree'

" Themes
" Plug 'morhetz/gruvbox'
Plug 'gruvbox-community/gruvbox'
" Plug 'altercation/vim-colors-solarized'

" Syntax and AutoCompletion
Plug 'scrooloose/syntastic'
Plug 'leafgarland/typescript-vim'
Plug 'puremourning/vimspector'
" YCM requires python3.8 and cmake
" Plug 'valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang --gocode-completer' }

call plug#end()

" ----- PLUGIN SETTINGS -----
let g:mapleader=' '           " leader key
set history=5000
set showcmd
set nojoinspaces
set complete-=t

" ----- NERDTree -----
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" ----- Gruvbox -----
colorscheme gruvbox
set background=dark

" ----- Viminspector -----
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dh <Plug>VimspectorRestart
nmap <Leader>dl <Plug>VimspectorStepOut
nmap <Leader>dk <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

" ----- Some Special Configs for XMLs -----
if has("autocmd")
    au BufNewFile,BufRead *.sgml,*.ent,*.xsl,*.xml call Set_SGML()
    au BufNewFile,BufRead *.[1-9] call ShowSpecial()
endif " has(autocmd)

function Set_Highlights()
    "match ExtraWhitespace /^\s* \s*\|\s\+$/
    highlight default link OverLength ErrorMsg
    match OverLength /\%71v.\+/
    return 0
endfunction " Set_Highlights()

function ShowSpecial()
    setlocal list listchars=tab:>>,trail:*,eol:$
    hi def link nontext ErrorMsg
    return 0
endfunction " ShowSpecial()


