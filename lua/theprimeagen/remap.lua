vim.g.mapleader = " "
vim.opt.timeoutlen = 2000
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc=":Ex"})
vim.keymap.set("n", "<leader>pz", function()
    vim.api.nvim_command(":w")
    vim.cmd.Ex()
end)

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        if opts.desc then
            opts.desc = "keymaps.lua: " .. opts.desc
        end
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

local nxo = {"n", "x", "o"}
map(nxo, "n", "j")
map(nxo, "e", "k")
map(nxo, "m", "h")
map(nxo, "i", "l")

map(nxo, "l", "e")
map(nxo, "k", "n")
map(nxo, "j", "m")
map(nxo, "h", "i")

map(nxo, "v", "g")
map(nxo, "g", "v")
map(nxo, "vv", "gg")

map(nxo, "w", "b")
map(nxo, "b", "w")
map(nxo, "W", "B")
map(nxo, "B", "W")

map(nxo, "N", "J")
map(nxo, "E", "K")
map(nxo, "M", "H")
map(nxo, "I", "L")

map(nxo, "L", "E")
map(nxo, "K", "N")
map(nxo, "J", "M")
map(nxo, "H", "I")

map(nxo, "V", "G")
map(nxo, "G", "V")
map(nxo, "<C-g>", "<C-v>")


map(nxo, '<C-n>', '<C-d>zz')
map(nxo, '<C-e>', '<C-u>zz')


map('n', 'k', 'nzzzv')
map('n', 'K', 'Nzzzv')

vim.keymap.set("v", "N", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "E", ":m '<-2<CR>gv=gv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


-- Navigate Windows
vim.keymap.set("n", "<leader>m", "<C-w>h")
vim.keymap.set("n", "<leader>n", "<C-w>j")
vim.keymap.set("n", "<leader>e", "<C-w>k")
vim.keymap.set("n", "<leader>i", "<C-w>l")
vim.keymap.set("n", "<leader>o", "<cmd>on<CR>", { desc = "Make current window only window." })

-- Resize Windows
vim.keymap.set("n", "<C-Left>", "5<C-w><")
vim.keymap.set("n", "<C-Right>", "5<C-w>>")
vim.keymap.set("n", "<C-Up>", "5<C-w>+")
vim.keymap.set("n", "<C-Down>", "5<C-w>-")


-- Disable arrow keys
vim.keymap.set({ 'n', 'i', 'v', 'x' }, "<Left>", "<nop>")
vim.keymap.set({ 'n', 'i', 'v', 'x' }, "<Right>", "<nop>")
vim.keymap.set({ 'n', 'i', 'v', 'x' }, "<Up>", "<nop>")
vim.keymap.set({ 'n', 'i', 'v', 'x' }, "<Down>", "<nop>")

-- copy all
vim.keymap.set("n", "<leader>ca", 'ggVG"+y<C-o>')

-- not rly useful
vim.keymap.set({ 'n', 'v', 'x' }, "q", "<nop>")
vim.keymap.set({ 'n', 'v', 'x' }, "@", "<nop>")
