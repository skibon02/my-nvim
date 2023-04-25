
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    --theme
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    vim.cmd('colorscheme rose-pine')

    use 'williamboman/mason.nvim'    
    use 'williamboman/mason-lspconfig.nvim'

    use 'neovim/nvim-lspconfig' 
    use { 'simrat39/rust-tools.nvim', commit = 'b50125d342b7c5b14d331476d0e0bec9b4aebcb7' }

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

    use 'nvim-treesitter/nvim-treesitter'

    --navigation
    use 'theprimeagen/harpoon'
    use 'theprimeagen/vim-be-good'



    --debugging
    use 'mfussenegger/nvim-dap' 
    use { 'jedrzejboczar/nvim-dap-cortex-debug', requires = 'mfussenegger/nvim-dap' }
    use 'puremourning/vimspector'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

    use({ 'theHamsta/nvim-dap-virtual-text', as = 'dap-text' })

    --usefull stuff
    use 'voldikss/vim-floaterm'
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'

end)
