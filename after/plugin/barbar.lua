vim.g.barbar_auto_setup = false

require("barbar").setup {
    sidebar_filetypes = {
        undotree = { text = 'undotree' },
        NvimTree = true,
        DapUI = true,
    },
    icons = {
        button = false,
        diagnostics = {
            [vim.diagnostic.severity.ERROR] = { enabled = true },
            [vim.diagnostic.severity.WARN] = { enabled = true },
            [vim.diagnostic.severity.INFO] = { enabled = false },
            [vim.diagnostic.severity.HINT] = { enabled = true },
        },
        gitsigns = {
            added = { enabled = true, icon = '+' },
            changed = { enabled = true, icon = '~' },
            deleted = { enabled = true, icon = '-' },
        },

        modified = {
            color="yellow"
        }
    }
}


vim.keymap.set({ "n", "x" }, "<c-l>", "<cmd>BufferPrev<CR>", { desc = 'Prev tab', noremap = true })
vim.keymap.set({ "n", "x" }, "<c-u>", "<cmd>BufferNext<CR>", { desc = 'Next tab', noremap = true })
vim.keymap.set({ "n", "x" }, "<c-y>", "<cmd>BufferClose<CR>", { desc = 'Close tab', noremap = true })

vim.keymap.set({ "n", "x" }, "<leader>1", "<cmd>BufferGoto 1<CR>", { desc = 'Tab 1', noremap = true })
vim.keymap.set({ "n", "x" }, "<leader>2", "<cmd>BufferGoto 2<CR>", { desc = 'Tab 2', noremap = true })
vim.keymap.set({ "n", "x" }, "<leader>3", "<cmd>BufferGoto 3<CR>", { desc = 'Tab 3', noremap = true })
vim.keymap.set({ "n", "x" }, "<leader>4", "<cmd>BufferGoto 4<CR>", { desc = 'Tab 4', noremap = true })
