local telescope = require('telescope')
local actions = require('telescope.actions')
local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")

local largeFilesIgnoringPreviewer = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then return end
    if stat.size > 100000 then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end


telescope.setup {
    defaults = {
        color_devicons = false,
        prompt_prefix = "$ ",
        buffer_previewer_maker = largeFilesIgnoringPreviewer,
        wrap_results = true,
        file_ignore_patterns = { "git", "node_modules" },
        mappings = {
            i = {
                ['<esc>'] = actions.close
            }
        },
        pickers = {
          oldfiles = { initial_mode = "normal", sorter = sorters.fuzzy_with_index_bias() },
          find_files = { hidden = true, },
          git_files = { show_untracked = true }
        }
    }
}
-- To get fzf loaded and working with telescope,
-- you need to call load_extension, somewhere after
-- the setup function.
-- telescope.load_extension('fzf')


local module = {}

module.search_dotfiles = function()
    require('telescope.builtin').find_files({
        prompt_title = "<.dotfiles>",
        cwd = '~/.dotfiles',
        hidden = true
    })
end

module.project_files = function()
    local opts = {}
    local ok = pcall(require('telescope.builtin').git_files, opts)
    if not ok then require('telescope.builtin').find_files(opts) end
end

vim.api.nvim_set_keymap('n', '<Leader>p', ':lua require\'telescope_setup\'.project_files()<Cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>df', ':lua require\'telescope_setup\'.search_dotfiles()<Cr>', {noremap = true, silent = true})

local live_grep_in_glob = function(glob_pattern)
  require('telescope.builtin').live_grep({
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--glob=" .. (glob_pattern or ""),
    }
  })
end
module.live_grep_in_glob = function()
  vim.ui.input({ prompt = "Glob: ", completion = "file", default = "**/*." }, live_grep_in_glob)
end

return module

