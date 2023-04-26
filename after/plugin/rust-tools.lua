
local rt = require("rust-tools")

local mason_registry = require("mason-registry")
local codelldb_dir = mason_registry.get_package("codelldb"):get_install_path() .. "/"

local codelldb_path = codelldb_dir .. "extension/adapter/codelldb"
local liblldb_path = codelldb_dir .. "extension/lldb/lib/liblldb.so"

rt.setup({
    server = {
        on_attach = function(_, bufnr)
            local keymap_opts = { buffer = bufnr }
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, keymap_opts )
            -- code action groups
            vim.keymap.set("n", "<Leader>.", rt.code_action_group.code_action_group, keymap_opts)

            -- Runnables
            vim.keymap.set("n", "<leader>rr", rt.runnables.runnables)
            vim.keymap.set("n", "<leader>rd", rt.debuggables.debuggables)

            vim.keymap.set('n', '<leader>tr', "<cmd>FloatermNew cargo run<cr>")
        end,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy",
                },
            },
        },
    },
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
        codelldb_path, liblldb_path)
    }
})
