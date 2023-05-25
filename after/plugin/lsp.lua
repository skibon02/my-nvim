

--- Completion Plugin Setup

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
vim.o.completeopt = "menuone,noinsert,noselect"

-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"

-- Lua --

local lsp = require("lspconfig")
lsp.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }  -- Fix "Undefined global 'vim'" LSP error.
            }
        }
    }
}



-- LSP
vim.keymap.set("n", "M", vim.lsp.buf.hover)
vim.keymap.set("n", "vd", vim.lsp.buf.definition, {noremap = true, desc = 'Go to definition'})
vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, {noremap = true, desc='Find references'})
vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, {noremap = true, desc = 'Rename symbol'})
vim.keymap.set("n", "<leader>va", vim.lsp.buf.code_action, {desc = 'Code actions'})

vim.keymap.set("i", "<c-space>", vim.lsp.buf.signature_help, {noremap = true})

-- Goto previous/next diagnostic warning/error
vim.keymap.set("n", "<leader>[", vim.diagnostic.goto_prev, {desc='Diag prev'})
vim.keymap.set("n", "<leader>]", vim.diagnostic.goto_next, {desc='Diag next'})

vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true
})



