local clangd = require("clangd_extensions")
clangd.setup({
    server = {
        on_attach = function(client, bufnr)
            vim.keymap.set("n", "<leader>hh", "<cmd>ClangdSwitchSourceHeader<CR>", { buffer = bufnr })

            vim.keymap.set('n', '<leader>tr', function() vim.api.nvim_command('FloatermNew cmake .. && make') end, {noremap = true})
        end,
    },
    extensions = { autoSetHints = false },
})
