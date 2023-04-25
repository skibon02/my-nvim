local clangd = require("clangd_extensions")
clangd.setup({
    server = {
        on_attach = function(client, bufnr)
            vim.keymap.set("n", "<leader>hh", "<cmd>ClangdSwitchSourceHeader<CR>", { buffer = bufnr })
        end,
    },
    extensions = { autoSetHints = false },
})
