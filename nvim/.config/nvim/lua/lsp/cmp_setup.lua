-- ~/.config/nvim/lua/cmp_setup.lua

local cmp = require('cmp')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- Pass LSP capabilities, indicating nvim-cmp is active
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())

cmp.setup({
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },  -- LSP source
    { name = 'buffer' },  -- Current buffer words
    { name = 'path' },    -- File paths
  }),
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(), -- Trigger popup
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept selected
    ['<C-e>'] = cmp.mapping.abort(), -- Close menu
    -- Tab/S-Tab for navigation
    ['<Tab>'] = cmp.mapping(function(fallback) if cmp.visible() then cmp.select_next_item() else fallback() end end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback) if cmp.visible() then cmp.select_prev_item() else fallback() end end, { 'i', 's' }),
  }),
  completion = { completeopt = 'menu,menuone,noselect' },
})

_G.LSP_CAPABILITIES = capabilities

