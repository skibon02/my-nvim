

--- Completion Plugin Setup

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
vim.o.completeopt = "menuone,noinsert,noselect"

-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + "c"
local cmp = require'cmp'
cmp.setup({
    -- Enable LSP snippets
    preselect = cmp.PreselectMode.None,
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        -- Add tab support
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),

        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),


        ['<CR>'] = cmp.mapping.confirm({ -- Enter to complete
            select = false,
        }),
        ['<C-e>'] = cmp.mapping.abort(),
    },
    -- Installed sources:
    sources = {
        { name = 'nvim_lsp', keyword_length = 1},      -- from language server
        { name = 'nvim_lsp_signature_help', keyword_length = 1},            -- display function signatures with current parameter emphasized
        { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
        { name = 'path' },                              -- file paths
        { name = 'buffer', keyword_length = 3 },        -- source current buffer
        --{ name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
        { name = 'calc'},                               -- source for math calculation
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                nvim_lua = 'λ',
                nvim_lsp_signature_help = 'λ',
                path = 'Ω',
                buffer = 'Ω',
                calc = 'Ω',
            }

            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
})


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
vim.keymap.set("n", "H", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action)

vim.keymap.set("i", "<c-h>", vim.lsp.buf.signature_help)

vim.keymap.set("n", "ga", vim.lsp.buf.code_action)

-- Goto previous/next diagnostic warning/error
vim.keymap.set("n", "g[", vim.diagnostic.goto_prev)
vim.keymap.set("n", "g]", vim.diagnostic.goto_next)

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
  },
})
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {border = 'rounded'}
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {border = 'rounded'}
)
