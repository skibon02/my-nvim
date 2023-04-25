-- debug menu
--vim.cmd([[
--nmap <S-F5> <cmd>call vimspector#Launch()<cr>
--nmap <F5> <cmd>call vimspector#Continue()<cr>
--nmap <F2> <cmd>call vimspector#Reset()<cr>
--nmap <F10> <cmd>call vimspector#StepOver()<cr>")
--nmap <S-F10> <cmd>call vimspector#StepOut()<cr>")
--nmap <F11> <cmd>call vimspector#StepInto()<cr>")
--]])

-- code debug actions
local dap = require('dap')
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)


vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='🔵', texthl='', linehl='', numhl=''})

dap.adapters.lldb = {
	type = "executable",
	command = "/home/skygrel19/.local/share/nvim/mason/packages/codelldb/codelldb",
	name = "lldb",
    args = {"--port", "0"},
}

dap.configurations.rust = {
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
