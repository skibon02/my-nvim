
local cor_debug = require('dap-cortex-debug');
cor_debug.setup {
    debug = false,  -- log debug messages
    -- path to cortex-debug extension, supports vim.fn.glob
    extension_path = '~'
        .. '/.vscode/extensions/marus25.cortex-debug-*/',
    lib_extension = nil, -- tries auto-detecting, e.g. 'so' on unix
    node_path = 'node', -- path to node.js executable
    dapui_rtt = true, -- register nvim-dap-ui RTT element
    dap_vscode_filetypes = { 'c', 'cpp' }, -- make :DapLoadLaunchJSON register cortex-debug for C/C++, set false to disable
}
