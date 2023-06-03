vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- use 'neovim/nvim-lspconfig'

    -- Completion framework:
    use 'hrsh7th/nvim-cmp'

    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    -- use 'hrsh7th/cmp-buffer'

    -- debugging
    use { 'mfussenegger/nvim-dap' }
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
end)
