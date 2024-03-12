return {

    -- AI
    { 'github/copilot.vim',          version = '1.18.0' },

    -- EDITING AND KEYBINDINGS
    "lukas-reineke/indent-blankline.nvim",
    "jiangmiao/auto-pairs",
    "windwp/nvim-ts-autotag",
    "tpope/vim-sleuth",
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        'jghauser/fold-cycle.nvim',
        config = function()
            require('fold-cycle').setup()
        end
    },
    'numToStr/Comment.nvim',
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    },

    -- APPEARANCE
    "folke/tokyonight.nvim",
    "EdenEast/nightfox.nvim", -- Packer
    'norcalli/nvim-colorizer.lua',
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    --vim.cmd("colorscheme tokyonight")
    "onsails/lspkind.nvim",
    { "nvim-tree/nvim-web-devicons", lazy = "true" },


    -- NAVIGATION AND FILES
    "theprimeagen/harpoon",
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    "simrat39/symbols-outline.nvim", -- archived

    { "nvim-treesitter/nvim-treesitter", build = ':TSUpdate' },
    "mbbill/undotree",
    "nvim-tree/nvim-tree.lua",

    -- GIT PLUGINS
    "tpope/vim-fugitive",
    "tpope/vim-rhubarb",
    "lewis6991/gitsigns.nvim",

    -- LATEX
    {
        'lervag/vimtex',
        ft = "tex"
    },
    'SirVer/ultisnips',

    -- Go
    -- use {
    --     'olexsmir/gopher.nvim',
    --     ft = 'go',
    --     config = function() require("gopher").setup() end,
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-treesitter/nvim-treesitter"
    --     },
    --     build = function() vim.cmd [[silent! GoInstallDeps]] end
    -- }
    {
        'ray-x/go.nvim',
        ft = "go"

    },

    -- Rust
    {
        "rust-lang/rust.vim",
        ft = "rust",
        config = function()
            vim.g.rustfmt_autosave = 1
        end
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        ft = { 'rust' },
    },
    {
        'saecki/crates.nvim',
        event = { "BufRead Cargo.toml" },
        ft = "rust",
        config = function()
            require('crates').setup()
        end,
    },

    -- LSP
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "VeryLazy"
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
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
            { 'j-hui/fidget.nvim',                  event = "VeryLazy", pin = true, version = 'legacy', opts = {} },

            -- Additional lua configuration
            'folke/neodev.nvim'
        }
    },

    "mfussenegger/nvim-jdtls",

    -- DEBUGGER
    "mfussenegger/nvim-dap",
    "rcarriga/cmp-dap",
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui"
        },
        config = function()
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap"
        },
        event = "VeryLazy"
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap"
        },
        opts = {}
    },
    {
        "leoluz/nvim-dap-go",
        dependencies = {
            "mfussenegger/nvim-dap"
        },
        ft = "go",
        config = function()
            require("dap-go").setup()
        end
    },
    "NvChad/nvterm",

    'tpope/vim-dispatch',
    'folke/neovim',

    -- Beancount
    "crispgm/cmp-beancount",
    { "nathangrigg/vim-beancount",       ft = "beancount" },

}
