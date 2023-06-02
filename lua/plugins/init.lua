vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use { "ellisonleao/gruvbox.nvim" }

    use { 'williamboman/mason.nvim',
        config = function()
            require("mason").setup({})
        end }

    use 'neovim/nvim-lspconfig'

    -- Completion framework:
    use 'hrsh7th/nvim-cmp'

    -- LSP completion source:
    use 'hrsh7th/cmp-nvim-lsp'

    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'

    use('nvim-treesitter/nvim-treesitter', { run = 'TSUpdate' })
    use('nvim-treesitter/nvim-treesitter-context')
    use('nvim-treesitter/nvim-treesitter-refactor')
    use('nvim-treesitter/nvim-treesitter-textobjects')

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    -- debugging
    use { 'mfussenegger/nvim-dap' }
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use({ 'theHamsta/nvim-dap-virtual-text', as = 'dap-text' })
    use { 'jedrzejboczar/nvim-dap-cortex-debug', requires = 'mfussenegger/nvim-dap' }



    use { "nvim-tree/nvim-web-devicons" }

    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

    use "nvim-tree/nvim-tree.lua"
end)
