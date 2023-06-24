
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
            -- code action groups
            vim.keymap.set("n", "<C-space>", rt.code_action_group.code_action_group, keymap_opts)

            -- Runnables
            vim.keymap.set("n", "<leader>rr", rt.runnables.runnables, {desc='Rust run'})
            vim.keymap.set("n", "<leader>rd", rt.debuggables.debuggables, {desc='Rust debug'})

            -- Floaterm
            vim.keymap.set('n', '<leader>tr', "<cmd>FloatermNew --autoclose=0 cargo mommy run<cr>", {desc='Cargo run terminal'})
            vim.keymap.set('n', '<leader>tb', "<cmd>w<CR><cmd>FloatermNew --autoclose=0 cargo mommy build --release<cr>", {desc='Cargo build terminal'})
            vim.keymap.set('n', '<leader>td', "<cmd>w<CR><cmd>FloatermNew --autoclose=0 cargo mommy build<cr>", {desc='Cargo build terminal'})

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
