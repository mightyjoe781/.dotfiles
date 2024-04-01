-- Uncomment below to install plug manager

local vim = vim -- to avoid undefined vim warning all down the file
-- vim.cmd [[
--  let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
--
--  if empty(glob(data_dir . '/autoload/plug.vim'))
--
--      silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
--
--      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
--
--  endif
-- ]]

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')






vim.call('plug#end')
