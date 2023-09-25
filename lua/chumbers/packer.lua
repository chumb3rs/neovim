vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- AI
    use 'github/copilot.vim'
    use({
        "dreamsofcode-io/ChatGPT.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    })

    use {
        'jghauser/fold-cycle.nvim',
        config = function()
            require('fold-cycle').setup()
        end
    }


    -- EDITING AND KEYBINDINGS
    use "lukas-reineke/indent-blankline.nvim"
    use "tpope/vim-sleuth"
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use 'numToStr/Comment.nvim'

    -- APPEARANCE
    use "folke/tokyonight.nvim"
    use "EdenEast/nightfox.nvim" -- Packer
    use 'norcalli/nvim-colorizer.lua'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    vim.cmd("colorscheme tokyonight")


    -- NAVIGATION AND FILES
    use('theprimeagen/harpoon')
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'christoomey/vim-tmux-navigator',
        lazy = false
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('mbbill/undotree')
    use('nvim-tree/nvim-tree.lua')

    -- GIT PLUGINS
    use('tpope/vim-fugitive')
    use('tpope/vim-rhubarb')
    use('lewis6991/gitsigns.nvim')

    use 'akinsho/toggleterm.nvim'

    -- LATEX
    use {
        'lervag/vimtex',
        ft = "tex"
    }
    use 'SirVer/ultisnips'

    -- LSP
    use "jose-elias-alvarez/null-ls.nvim"
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional

            -- Useful status updates
            { 'j-hui/fidget.nvim',                tag = 'legacy', opts = {} },

            -- Additional lua configuration
            'folke/neodev.nvim'
        }
    }

    -- DEBUGGER
    use {
        "mfussenegger/nvim-dap",
        config = function()
        end
    }
    use {
        "mfussenegger/nvim-dap-python",
        requires = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui"
        },
        config = function()
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
        end
    }
    use {
        "rcarriga/nvim-dap-ui",
        requires = {
            "mfussenegger/nvim-dap"
        }
    }

    use 'tpope/vim-dispatch'
    use 'folke/neovim'
end)
