local vim = vim -- gets rid of warnings for every global undefined vim variable
vim.opt.guicursor = ""
vim.opt.showmatch = false
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = ".undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.autoread = true -- autoreads file if changed by other editor
vim.opt.cmdheight = 1 -- Give more space for displaying messages.
vim.opt.equalalways = false -- New vim windows created won't make everything back to same sizes
vim.opt.spell = true
vim.opt.spelllang = "en_us" -- use z= to get word suggestions from vim. zg to add a word to dictionary and zw will mark word as wrong
vim.opt.colorcolumn = "80,120"
vim.opt.guifont="JetBrainsMonoNL Nerd Font Mono:h18"
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#404040" })

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")
vim.opt.shortmess:remove("F")

-- configure completion
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.complete:append("k")

if vim.fn.executable('rg') then
  vim.g.rg_derive_root = 'true'
end
vim.g.loaded_matchparen = 1
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.netrw_browse_split = 2
vim.g.netrw_liststyle = 0
vim.g.vrfr_rg = 'true'
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
-- in millisecond, used for both CursorHold and CursorHoldI,
-- use updatetime instead if not defined
vim.g.cursorhold_updatetime = 100
Mytabline = function ()
  return '%{tabpagenr()} / %{tabpagenr(\'$\')}%=%{getcwd()} - %{tabpagenr()} / %{tabpagenr(\'$\')}%='
end
vim.api.nvim_set_option('tabline', '%!v:lua.Mytabline()')
vim.opt.showtabline = 2 -- show tabline always
vim.g.python3_host_prog = "/opt/homebrew/bin/python3"

vim.diagnostic.config({
  float = {
    source = 'always',
  },
})

