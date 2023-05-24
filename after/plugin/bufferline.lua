require("bufferline").setup{}

vim.keymap.set({"n", "x"}, "<c-l>", ":BufferLineCyclePrev<CR>", {desc = 'Prev tab', noremap = true})
vim.keymap.set({"n", "x"}, "<c-u>", ":BufferLineCycleNext<CR>", {desc = 'Next tab', noremap = true})
vim.keymap.set({"n", "x"}, "<c-y>", ":bd<CR>", {desc = 'Close tab', noremap = true})
