-- ~/.config/nvim/lua/lsp_config.lua (The most compatible configuration)

-- Get the capabilities defined in cmp_setup.lua from the global scope
local capabilities = _G.LSP_CAPABILITIES or vim.lsp.protocol.make_client_capabilities()
local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

-- Define the list of servers we want mason to install
-- Note: JDTLS (Java) is excluded here as it always needs a custom setup block
local servers = {
    "gopls", "pyright", "rust_analyzer", "clangd", "lua_ls",
}

-- Setup Mason (handles installation of executables)
require("mason").setup()

-- Ensure the servers are installed if missing
mason_lspconfig.setup({
    ensure_installed = servers,
})

-- *** This is the reliable part that fixes all errors: ***
-- Manually loop through every server and configure it using the stable API.

for _, server_name in ipairs(servers) do
  lspconfig[server_name].setup({
      -- This applies the same capabilities and on_attach function to all LSPs
      capabilities = capabilities,
      on_attach = function(client, bufnr)
          -- Optional: Set up your global keymaps here for LSP actions
          -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { silent = true, buffer = bufnr })
      end,
      -- Add any settings common to all LSPs here (e.g., format on save)
  })
end

-- Add any unique configuration for specific servers *after* the loop
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim', 'require' } },
        },
    },
})

-- If you added the cmp_setup.lua file correctly earlier,
-- autocompletion should now be fully functional.

