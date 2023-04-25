vim.keymap.set("t", "<F8>", "<C-\\><C-n><cmd>FloatermToggle<CR>")
vim.keymap.set("n", "<F8>", "<cmd>FloatermToggle<CR>")

vim.keymap.set('n', '<leader>t', function() vim.api.nvim_command('FloatermNew ' .. vim.fn.input('CMD: ')) end)
vim.keymap.set('n', '<leader>tr', function() vim.api.nvim_command('FloatermNew cargo run') end)
