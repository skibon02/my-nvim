local kind_icons = {
    Class = "ﴯ",
    Color = "",
    Constant = "",
    Constructor = "",
    Enum = "",
    EnumMember = "",
    Event = "",
    Field = "",
    File = "",
    Folder = "",
    Function = "",
    Interface = "",
    Keyword = "",
    Method = "",
    Module = "",
    Operator = "",
    Property = "ﰠ",
    Reference = "",
    Snippet = "",
    Struct = "",
    Text = "",
    TypeParameter = "",
    Unit = "",
    Value = "",
    Variable = "",
}

local cmp = require 'cmp'
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

        ['<C-e>'] = cmp.mapping.scroll_docs(-4),
        ['<C-n>'] = cmp.mapping.scroll_docs(4),


        ['<CR>'] = cmp.mapping.confirm({ -- Enter to complete
            select = false,
        }),
        ['<C-f>'] = cmp.mapping.abort(),
    },
    -- Installed sources:
    sources = {
        { name = 'nvim_lsp',                keyword_length = 1 }, -- from language server
        { name = 'nvim_lsp_signature_help', keyword_length = 1 }, -- display function signatures with current parameter emphasized
        { name = 'nvim_lua',                keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
        { name = 'path' },                                       -- file paths
        { name = 'buffer',                  keyword_length = 3 }, -- source current buffer
        --{ name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip
        { name = 'calc' },                                       -- source for math calculation
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) --Concatonate the icons with name of the item-kind
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                spell = "[Spellings]",
                zsh = "[Zsh]",
                buffer = "[Buffer]",
                ultisnips = "[Snip]",
                treesitter = "[Treesitter]",
                calc = "[Calculator]",
                nvim_lua = "[Lua]",
                path = "[Path]",
                nvim_lsp_signature_help = "[Signature]",
                cmdline = "[Vim Command]"
            })[entry.source.name]
            return vim_item
        end,
    },
})
