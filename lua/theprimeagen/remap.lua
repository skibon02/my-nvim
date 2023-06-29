--vim.keymap.set("n", "<leader>bh", vim.cmd.Ex, {desc="Exit"})
--vim.keymap.set("n", "<leader>bn", function()
    --vim.api.nvim_command(":w")
    --vim.cmd.Ex()
--end, {desc="Save and exit"})

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

local n = "n"
local nx = {"n", "x"}
local nxo = {"n", "x", "o"}
map(nx, "n", "gj")
map(nx, "e", "gk")
map(nxo, "m", "h")
map(nxo, "i", "l")

map(nxo, "l", "e")
map(nxo, "k", "n")
map(nxo, "j", "m")
map(nxo, "h", "i")

--vim.keymap.del("n", "g%")
--vim.keymap.del("n", "gx")
map(nxo, "v", "g")
map(nxo, "g", "v")
map(nxo, "<c-g>", "<c-v>")
map(nx, "vv", "gg")

map(nxo, "w", "b")
map(nxo, "b", "w")
map(nxo, "W", "B")
map(nxo, "B", "W")

map(nx, "N", "J")
map(nx, "E", "K")
map(nx, "M", "H")
map(nx, "I", "L")

map(nx, "L", "E")
map(nx, "K", "N")
map(nx, "J", "M")
map(nx, "H", "I")

map(nx, "V", "G")
map(nx, "G", "V")


map(nx, '<C-n>', '<C-d>zz')
map(nx, '<C-e>', '<C-u>zz')
map(nx, '<c-m>', '<c-o>')
map(nx, '<c-i>', '<c-i>')


map('n', 'k', 'nzzzv')
map('n', 'K', 'Nzzzv')

vim.keymap.set("v", "N", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "E", ":m '<-2<CR>gv=gv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], {desc = 'Paste w/o yank'})
vim.keymap.set("x", "<leader>y", [["+y]], {desc = 'Yank to system clipboard'})
vim.keymap.set("x", "<leader>d", [["_d]], {desc = 'Delete w/o yank'})

-- I really need this
vim.keymap.set("i", "<C-c>", "<cmd>w<cr><Esc>")
vim.keymap.set("i", "<Esc>", "<cmd>w<cr><Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>fa", vim.lsp.buf.format, {desc='Format document'})

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {noremap = true, desc='Replace cur word with...'})


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
vim.keymap.set("n", "<leader>ca", 'ggVG"+y<C-o>', {noremap = true, desc = 'Copy all to clipboard'})

-- not rly useful
vim.keymap.set({ 'n', 'v', 'x' }, "q", "<nop>")
vim.keymap.set({ 'n', 'v', 'x' }, "@", "<nop>")
