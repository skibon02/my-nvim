-- code debug actions
local dap = require('dap')

dap.defaults.fallback.exception_breakpoints = { 'all' }

local mason_registry = require("mason-registry")
local codelldb = mason_registry.get_package("codelldb") -- note that this will error if you provide a non-existent package name

dap.adapters.lldb = {
    type = "executable",
    command = codelldb:get_install_path() .. "/codelldb",
    name = "lldb",
    args = {"--port", "0"},
}

dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
    },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp


vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)

vim.keymap.set("n", "<leader>br", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>bc", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint Condition: "))
end)

vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='🔵', texthl='', linehl='', numhl=''})


require("nvim-dap-virtual-text").setup()
