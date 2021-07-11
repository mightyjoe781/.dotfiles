"---------------------------------------------------------------------
" File     : .vimrc
" Purpose  : config file for vim
" Revision : 210419
" License  : MIT
" Author   : smk

"---------------------------------------------------------------------
" Basic Config

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality This
" configuration option turns out not to be necessary for the file
" named " '~/.vimrc', because Vim automatically enters nocompatible
" mode if that file " is present. But we're including it here just in
" case this config file is " loaded some other way (e.g.  saved as
" `foo`, and then Vim started with " `vim -u foo`).
set nocompatible
" sets text width to 70 and color the 72 column
set textwidth=70 
set colorcolumn=72
set ts=4 sw=4 " tab to 4
set wrap

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show relative line numbers
set number 
set relativenumber

" shows status bar below
set laststatus=2
set statusline=%-4m%f\ %y\ \ %=%{&ff}\ \|\ %{&fenc}\ [%l:%c]

" The backspace key has slightly unintuitive behavior by default.  For
" example, " by default, you can't backspace before the insertion
" point set with 'i'.  This configuration makes backspace behave more
" reasonably, in that you can " backspace over anything.
set backspace=indent,eol,start

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

" Enable searching as you type, rather than waiting till you press
" enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> 
" 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but
" it can sometimes be convenient.
set mouse+=a 
filetype plugin indent on " enable file type detection
set autoindent
" open new split panes to right and bottom, which feels more natural
set splitbelow 
set splitright
" Try to prevent bad habits like using the arrow keys for movement.
" This is not the only possible bad habit. For example, holding down
" the h/j/k/l keys
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
" Plugin Configs

" with pathogen infect we wish to install can be extracted to a 
" subdirectory and they will add to 'runtimepath'
" All the pathogen plugin can be extracted under subdirectory
" ~/.vim/bundle

"This is ctrlp.vim plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim

