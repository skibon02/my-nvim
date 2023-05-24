vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

local function on_attach(bufnr)
   local api = require('nvim-tree.api')

    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    -- add your mappings
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    vim.keymap.set('n', 'n', 'j', opts('Down'))
    vim.keymap.set('n', 'e', 'k', opts('Up'))
end

-- OR setup with some options
local nvimTree = require("nvim-tree")
nvimTree.setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  on_attach = on_attach
})

vim.keymap.set('n', "<leader>;", ":NvimTreeToggle<CR>", {noremap = true, desc = 'Toggle tree view'})
vim.keymap.set('n', "<leader>y", ":NvimTreeFocus<CR>", {noremap = true, desc = 'Focus tree view'})
