
local rt = require("rust-tools")

local mason_registry = require("mason-registry")
local codelldb_dir = mason_registry.get_package("codelldb"):get_install_path() .. "/"

local codelldb_path = codelldb_dir .. "extension/adapter/codelldb"
local liblldb_path = codelldb_dir .. "extension/lldb/lib/liblldb.so"

rt.setup({
    tools = {
        runnables = {
            use_telescope = true,
        },
        inlay_hints = {
            auto = true,
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
    server = {
        on_attach = function(_, bufnr)
            local keymap_opts = { buffer = bufnr }
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, keymap_opts )
            -- code action groups
            --vim.keymap.set("n", "<Leader>.", rt.code_action_group.code_action_group, keymap_opts)

            print('hello')
            -- Runnables
            vim.keymap.set("n", "<leader>rr", rt.runnables.runnables)
            vim.keymap.set("n", "<leader>rd", rt.debuggables.debuggables)

            -- Floaterm
            vim.keymap.set('n', '<leader>tr', "<cmd>FloatermNew cargo run<cr>")

            -- LSP
            vim.keymap.set("n", "H", vim.lsp.buf.hover, keymap_opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
            vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, keymap_opts)
            vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, keymap_opts)
            vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, keymap_opts)

            vim.keymap.set("i", "<c-h>", vim.lsp.buf.signature_help, keymap_opts)

            vim.keymap.set("n", "ga", vim.lsp.buf.code_action, keymap_opts)

            -- Goto previous/next diagnostic warning/error
            vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, keymap_opts)
            vim.keymap.set("n", "g]", vim.diagnostic.goto_next, keymap_opts)


            -- Prepare dap-ui
            setupDapuiCortex()
        end,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy",
                },
                completion = {
                    callable = {
                        snippets = "add_parentheses"
                    }
                }
            },
        },
    },
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
        codelldb_path, liblldb_path)
    }
})
