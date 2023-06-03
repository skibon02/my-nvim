local dapui = require("dapui")

dapui.setup{}

vim.keymap.set("n", "<c-t>", dapui.toggle, {desc = "Toggle dapui"})
