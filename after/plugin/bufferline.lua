require("bufferline").setup {
    options = {
        diagnostics = "nvim_lsp",
        themable = true,
        separator_style = "slope",
        show_buffer_close_icons = false,
    }
}


vim.keymap.set({ "n", "x" }, "<c-l>", ":BufferLineCyclePrev<CR>", { desc = 'Prev tab', noremap = true })
vim.keymap.set({ "n", "x" }, "<c-u>", ":BufferLineCycleNext<CR>", { desc = 'Next tab', noremap = true })
vim.keymap.set({ "n", "x" }, "<c-y>", ":bd<CR>", { desc = 'Close tab', noremap = true })

vim.keymap.set({ "n", "x" }, "<leader>1", ":BufferLineGoToBuffer 1<CR>", { desc = 'Tab 1', noremap = true })
vim.keymap.set({ "n", "x" }, "<leader>2", ":BufferLineGoToBuffer 2<CR>", { desc = 'Tab 2', noremap = true })
vim.keymap.set({ "n", "x" }, "<leader>3", ":BufferLineGoToBuffer 3<CR>", { desc = 'Tab 3', noremap = true })
vim.keymap.set({ "n", "x" }, "<leader>4", ":BufferLineGoToBuffer 4<CR>", { desc = 'Tab 4', noremap = true })
