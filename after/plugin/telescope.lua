local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope' })
vim.keymap.set('n', '<leader>ft', builtin.git_files, { desc = 'Telescope git' })
