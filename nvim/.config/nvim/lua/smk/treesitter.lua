local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    -- ensure_installed = "maintained", -- one of "all", "maintained"
    sync_install = false, -- install languages synchronously (only applied to ensure_installed)
    ignore_install = { "" }, -- list of parsers to ignore installing
    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = true,
    },
    incremental_selection = {
        enable = true
    },
    textobjects = {
        enable = true
    },
    indent = { enable = true, disable = { "yaml" } },
}

