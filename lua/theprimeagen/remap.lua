vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<C-y>", function()
    -- Here will be go up directory in nvim file explorer
end)
vim.keymap.set("n", "<leader>pz", function()
    vim.api.nvim_command(":w")
    vim.cmd.Ex()
end)


vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true })


vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', { noremap = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.api.nvim_set_keymap('x', '<leader>p', '\"_dP', { noremap = true })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


-- Navigate Windows
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")

-- Resize Windows
vim.keymap.set("n", "<C-Left>", "5<C-w><")
vim.keymap.set("n", "<C-Right>", "5<C-w>>")
vim.keymap.set("n", "<C-Up>", "5<C-w>+")
vim.keymap.set("n", "<C-Down>", "5<C-w>-")

vim.keymap.set("n", "<leader>o", "<cmd>on<CR>", { desc = "Make current window only window." })

-- Disable arrow keys     KEK
vim.keymap.set({ 'n', 'i', 'v', 'x' }, "<Left>", "<nop>")
vim.keymap.set({ 'n', 'i', 'v', 'x' }, "<Right>", "<nop>")
vim.keymap.set({ 'n', 'i', 'v', 'x' }, "<Up>", "<nop>")
vim.keymap.set({ 'n', 'i', 'v', 'x' }, "<Down>", "<nop>")

-- copy all
vim.keymap.set("n", "<leader>ca", 'ggVG"+y<C-o>')

-- not rly useful
vim.keymap.set({ 'n', 'v', 'x' }, "q", "<nop>")
vim.keymap.set({ 'n', 'v', 'x' }, "@", "<nop>")
