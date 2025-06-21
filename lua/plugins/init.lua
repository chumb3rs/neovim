return {

    -- EDITING AND KEYBINDINGS
    "jiangmiao/auto-pairs",
    "windwp/nvim-ts-autotag",
    "tpope/vim-sleuth",
    "tpope/vim-obsession",
    "lewis6991/spaceless.nvim",

    -- APPEARANCE
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    "onsails/lspkind.nvim",

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = "OXY2DEV/markview.nvim",
    },

    -- GIT PLUGINS
    "tpope/vim-rhubarb",

    -- LATEX
    {
        "lervag/vimtex",
        ft = "tex",
    },

    -- GO
    {
        "ray-x/go.nvim",
        ft = "go",
    },

    -- Rust
    {
        "rust-lang/rust.vim",
        ft = "rust",
        config = function()
            vim.g.rustfmt_autosave = 1
        end,
    },
    {
        "mrcjkb/rustaceanvim",
        version = "^4", -- Recommended
        ft = { "rust" },
    },
    {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        ft = "rust",
        config = function()
            require("crates").setup({})
        end,
    },

    { "mfussenegger/nvim-jdtls", ft = "java" },

    -- DEBUGGER
    { "rcarriga/cmp-dap",        ft = { "python", "cpp", "javascript" } },
    {
        "rcarriga/nvim-dap-ui",
        ft = { "python", "cpp", "javascript" },
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
    },
    "nvim-telescope/telescope-dap.nvim",

    "folke/neovim",

    -- Beancount
    { "crispgm/cmp-beancount",     ft = "beancount" },
    { "nathangrigg/vim-beancount", ft = "beancount" },

    -- JSON
    {
        "b0o/schemastore.nvim",
        ft = "json",
    },

    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
    },

    { "junegunn/fzf" },
    { "junegunn/fzf.vim",                         dependencies = { "junegunn/fzf" } },
}
