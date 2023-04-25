vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', {noremap=true})
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', {noremap=true})


vim.api.nvim_set_keymap('n', 'n', 'nzzzv', {noremap=true})
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', {noremap=true})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.api.nvim_set_keymap('x', '<leader>p', '\"_dP', {noremap=true})


