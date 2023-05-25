vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- themes
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "ellisonleao/gruvbox.nvim" }
    use { "shaunsingh/nord.nvim" }
    use { "Mofiqul/vscode.nvim" }
    use { "chriskempson/base16-vim" }
    use { "jacoborus/tender.vim" }
    use 'Mofiqul/dracula.nvim'

    use { 'williamboman/mason.nvim',
        config = function()
            require("mason").setup({})
        end }
    use { 'williamboman/mason-lspconfig.nvim',
        config = function()
            require("mason-lspconfig").setup({
            })
        end }

    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'

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

    --navigation
    --use 'theprimeagen/harpoon'
    use 'theprimeagen/vim-be-good'

    -- debugging
    use { 'mfussenegger/nvim-dap' }
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use({ 'theHamsta/nvim-dap-virtual-text', as = 'dap-text' })
    use { 'jedrzejboczar/nvim-dap-cortex-debug', requires = 'mfussenegger/nvim-dap' }

    -- cmake build
    use 'Civitasv/cmake-tools.nvim'
    -- Extension To Set Up Clangd Language Server --
    use 'p00f/clangd_extensions.nvim'

    --usefull stuff
    use 'voldikss/vim-floaterm'
    use 'mbbill/undotree'



    -- Auto Pairs --
    use { 'windwp/nvim-autopairs' }

    -- Error Displayer --
    use { "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    }
    use { "nvim-tree/nvim-web-devicons" }

    use 'simrat39/symbols-outline.nvim'

    -- Which Key --
    use { "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

    use "nvim-tree/nvim-tree.lua"
end)
