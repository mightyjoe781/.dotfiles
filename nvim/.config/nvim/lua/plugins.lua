-- Uncomment below to install plug manager

local vim = vim -- to avoid undefined vim warning all down the file
 vim.cmd [[
  let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

  if empty(glob(data_dir . '/autoload/plug.vim'))

      silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC

  endif
 ]]

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')

-- Utilities

-- Tim-Pope Classics
Plug 'tpope/vim-fugitive'        -- Git Wrapper
Plug 'tpope/vim-surround'        -- Adds `s` command
Plug 'tpope/vim-commentary'      -- Adds comment actions
Plug 'tpope/vim-unimpaired'      -- Adds various [ and ] commands
Plug 'tpope/vim-repeat'          -- Remap '.' key

Plug 'airblade/vim-gitgutter'    -- Git-gutter plugin

Plug 'jremmen/vim-ripgrep'
Plug 'scrooloose/nerdtree'
-- original ctrp is not maintained anymore
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
-- Requires vim built with python 3.7+
Plug 'lyuts/vim-rtags'

-- Telescope file finder / picker, two above it are dependencies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'stevearc/dressing.nvim'

-- Project management
Plug 'nvim-telescope/telescope-project.nvim'


-- Themes
-- Plug 'morhetz/gruvbox'
Plug 'gruvbox-community/gruvbox'
-- Plug 'altercation/vim-colors-solarized'


vim.call('plug#end')

-- set the colorscheme to solarized
vim.cmd.colorscheme('gruvbox')




require('telescope_setup')





