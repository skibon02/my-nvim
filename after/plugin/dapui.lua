function setupDapuiCortex()
    require("dapui").setup{
        mappings = { remove = "b" },
        layouts = {
            {
                position = "left",
                size = 40,
                elements = {
                    { id = 'scopes', size = 0.4 },
                    { id = 'breakpoints', size = 0.3 },
                    { id = 'rtt', size = 0.3 }
                }
            },
            {
                position = "bottom",
                size = 9,
                elements = {
                    { id = 'stacks', size = 0.3 },
                    { id = 'watches', size = 0.7 },

                }
            }
        }
    }
end

function setupDapuiRust()
    require("dapui").setup{
        mappings = { remove = "b" },
    }
end

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

vim.keymap.set("n", "<leader>dui", dapui.toggle, {desc = "Toggle dapui"})
vim.keymap.set("n", "<leader>cdb", function()
    dap.terminate()
    dapui.close()
end)
vim.keymap.set("v", "<C-H>", function() dapui.eval() end)
