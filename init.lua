require("plugins")
require("theprimeagen")

function setupDapuiCortex()
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
end

function setupDapuiRust()
    require("dapui").setup{
        mappings = { remove = "b" },
    }
end
