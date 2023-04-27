local clangd = require("clangd_extensions")
clangd.setup({
    server = {
        on_attach = function(client, bufnr)
            vim.keymap.set("n", "<leader>hh", "<cmd>ClangdSwitchSourceHeader<CR>", { buffer = bufnr })

            vim.keymap.set('n', '<leader>cr',  "<cmd>CMakeRun<cr>")
            vim.keymap.set('n', '<leader>cb',  "<cmd>CMakeBuild<cr>")
        end,
    },
    extensions = { autoSetHints = false },
})
