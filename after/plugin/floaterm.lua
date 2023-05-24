vim.keymap.set("t", "<c-r>", "<C-\\><C-n><cmd>FloatermToggle<CR>")
vim.keymap.set("t", "<c-R>", "<C-\\><C-n><cmd>FloatermKill<CR>")
vim.keymap.set("n", "<leader>tf", "<cmd>FloatermToggle<CR>", {desc = "Open terminal"})

vim.keymap.set('n', '<leader>tr', function() vim.api.nvim_command('FloatermNew ' .. vim.fn.input('CMD: ')) end, {desc = "Execute single command"})
