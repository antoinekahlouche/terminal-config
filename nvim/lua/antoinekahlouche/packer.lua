vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- PACKAGE MANAGER ------------------------------------
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- THEME ----------------------------------------------
    use 'navarasu/onedark.nvim'
    use 'nvim-tree/nvim-web-devicons'

    -- NAVIGATION -----------------------------------------
    use 'nvim-tree/nvim-tree.lua'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'mbbill/undotree'

    -- LSP ------------------------------------------------
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-treesitter/playground' }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },                  -- Required
            { 'hrsh7th/cmp-nvim-lsp' },              -- Required
            { 'L3MON4D3/LuaSnip' },                  -- Required
        }
    }

    -- GIT ------------------------------------------------
    use({
        "NeogitOrg/neogit",
        requires = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration
            "nvim-telescope/telescope.nvim", -- optional
        },
        config = true
    })

    -- HELPER ---------------------------------------------
    use 'Pocco81/auto-save.nvim'
    use 'numToStr/Comment.nvim'
    use {
        'laytan/tailwind-sorter.nvim',
        requires = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
        run = 'cd formatter && npm i && npm run build',
    }
    use({ "stevearc/conform.nvim" })
end)
