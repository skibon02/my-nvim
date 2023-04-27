require("dapui").setup{
    mappings = { remove = "b" },
    layouts = {
        {
            position = "left",
            size = 40,
            elements = {
                { id = 'scopes', size = 0.4 },
                { id = 'rtt', size = 0.6 }
            }
        }
    }
}

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

vim.keymap.set("n", "<leader>dui", dapui.toggle, {desc = "Toggle dapui"})
vim.keymap.set("n", "<leader>cdb", function()
    dap.terminate()
    dapui.close()
end)
