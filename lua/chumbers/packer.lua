vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- AI
    use { 'github/copilot.vim', version = '1.18.0' }
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
    use "jiangmiao/auto-pairs"
    use "windwp/nvim-ts-autotag"
    use {
        'andymass/vim-matchup',
        setup = function()
            -- may set any options here
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end,
        config = function()
            require("match-up").setup()
        end
    }
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
    }
    vim.cmd("colorscheme tokyonight")
    use "onsails/lspkind.nvim"
    use "nvim-tree/nvim-web-devicons"


    -- NAVIGATION AND FILES
    use('theprimeagen/harpoon')
    use {
        'nvim-telescope/telescope.nvim',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'christoomey/vim-tmux-navigator',
        lazy = false
    }
    use "simrat39/symbols-outline.nvim"

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('mbbill/undotree')
    use('nvim-tree/nvim-tree.lua')

    -- GIT PLUGINS
    use('tpope/vim-fugitive')
    use('tpope/vim-rhubarb')
    use('lewis6991/gitsigns.nvim')

    -- LATEX
    use {
        'lervag/vimtex',
        ft = "tex"
    }
    use 'SirVer/ultisnips'

    -- Go
    use {
        'olexsmir/gopher.nvim',
        ft = 'go',
        config = function() require("gopher").setup() end,
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter"
        },
        run = function() vim.cmd [[silent! GoInstallDeps]] end
    }

    -- Rust
    use {
        "rust-lang/rust.vim",
        ft = "rust",
        config = function()
            vim.g.rustfmt_autosave = 1
        end
    }
    use {
        "simrat39/rust-tools.nvim",
    }
    use {
        "saecki/crates.nvim",
        ft = { "rust", "toml" },
        config = function() require("crates").setup() end
    }

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
            { 'hrsh7th/nvim-cmp' },                    -- Required
            { 'hrsh7th/cmp-nvim-lsp' },                -- Required
            { 'hrsh7th/cmp-nvim-lsp-signature-help' }, -- Optional
            { 'hrsh7th/cmp-buffer' },                  -- Optional
            --{ 'hrsh7th/cmp-path' },                    -- Optional
            { 'felipelema/cmp-async-path' },
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional

            -- Useful status updates
            { 'j-hui/fidget.nvim',                lock = true, tag = 'legacy', opts = {} },

            -- Additional lua configuration
            'folke/neodev.nvim'
        }
    }

    use "mfussenegger/nvim-jdtls"

    -- DEBUGGER
    use "mfussenegger/nvim-dap"
    use "rcarriga/cmp-dap"
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
    use {
        "jay-babu/mason-nvim-dap.nvim",
        requires = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap"
        }
    }
    use {
        "leoluz/nvim-dap-go",
        requires = {
            "mfussenegger/nvim-dap"
        }
    }
    use "NvChad/nvterm"

    use 'tpope/vim-dispatch'
    use 'folke/neovim'

    -- Beancount
    use "crispgm/cmp-beancount"
    use "nathangrigg/vim-beancount"
end)
