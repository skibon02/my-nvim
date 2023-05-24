require("bufferline").setup{}

vim.keymap.set({"n", "x"}, "<leader>[", ":BufferLineCyclePrev<CR>", {desc = 'Prev tab'})
vim.keymap.set({"n", "x"}, "<leader>]", ":BufferLineCycleNext<CR>", {desc = 'Prev tab'})
