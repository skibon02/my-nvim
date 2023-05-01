-- code debug actions
local dap = require('dap')
local dap_cortex_debug = require('dap-cortex-debug')

dap.defaults.fallback.exception_breakpoints = { 'all' }

local mason_registry = require("mason-registry")
local codelldb = mason_registry.get_package("codelldb") -- note that this will error if you provide a non-existent package name

local codelldb_path = codelldb:get_install_path()
-- codelldb_path = "/home/skygrel19/.vscode/extensions/vadimcn.vscode-lldb-1.9.1";

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = codelldb_path .. '/extension/adapter/codelldb',
    args = {"--port", "${port}"},

  }
}


dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp


-- parse defaul launch.json
require('dap.ext.vscode').load_launchjs();

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
