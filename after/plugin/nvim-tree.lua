vim.g.loaded_netrw = 1

vim.g.loaded_netrwPlugin = 1
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local api = require("nvim-tree.api")

-- empty setup using defaults
local function on_attach(bufnr)
    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    -- add your mappings
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    vim.keymap.set('n', 'n', 'j', opts('Down'))
    vim.keymap.set('n', 'e', 'k', opts('Up'))

    -- cool searching stuff from @kyazdani42
    -- vim.keymap.set('n', '<c-f>', telescope_actions.launch_find_files, opts('Launch Find Files'))
    -- vim.keymap.set('n', '<c-g>', telescope_actions.launch_live_grep, opts('Launch Live Grep'))

    vim.keymap.set("n", "<CR>", function ()
        local node = api.tree.get_node_under_cursor()
        api.node.open.edit()
        if node and node.type == 'file' then
            api.tree.close()
        end
    end, opts("Tab drop"))
end

-- OR setup with some options
local nvimTree = require("nvim-tree")
nvimTree.setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
    on_attach = on_attach
})

vim.keymap.set('n', "<leader>;", ":NvimTreeToggle<CR>", { noremap = true, desc = 'Toggle tree view' })
vim.keymap.set('n', "<leader>y", ":NvimTreeFocus<CR>", { noremap = true, desc = 'Focus tree view' })



-- Auto-closing thing
local function tab_win_closed(winnr)
    local tabnr = vim.api.nvim_win_get_tabpage(winnr)
    local bufnr = vim.api.nvim_win_get_buf(winnr)
    local buf_info = vim.fn.getbufinfo(bufnr)[1]
    local tab_wins = vim.tbl_filter(function(w) return w ~= winnr end, vim.api.nvim_tabpage_list_wins(tabnr))
    local tab_bufs = vim.tbl_map(vim.api.nvim_win_get_buf, tab_wins)
    if buf_info.name:match(".*NvimTree_%d*$") then -- close buffer was nvim tree
        -- Close all nvim tree on :q
        if not vim.tbl_isempty(tab_bufs) then      -- and was not the last window (not closed automatically by code below)
            api.tree.close()
        end
    else                                                          -- else closed buffer was normal buffer
        if #tab_bufs == 1 then                                    -- if there is only 1 buffer left in the tab
            local last_buf_info = vim.fn.getbufinfo(tab_bufs[1])[1]
            if last_buf_info.name:match(".*NvimTree_%d*$") then   -- and that buffer is nvim tree
                vim.schedule(function()
                    if #vim.api.nvim_list_wins() == 1 then        -- if its the last buffer in vim
                        vim.cmd "quit"                            -- then close all of vim
                    else                                          -- else there are more tabs open
                        vim.api.nvim_win_close(tab_wins[1], true) -- then close only the tab
                    end
                end)
            end
        end
    end
end

vim.api.nvim_create_autocmd("WinClosed", {
    callback = function()
        local winnr = tonumber(vim.fn.expand("<amatch>"))
        vim.schedule_wrap(tab_win_closed(winnr))
    end,
    nested = true
})
