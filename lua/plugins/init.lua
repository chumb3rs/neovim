return {

    -- EDITING AND KEYBINDINGS
    "jiangmiao/auto-pairs",
    "windwp/nvim-ts-autotag",
    "tpope/vim-sleuth",
    "tpope/vim-obsession",
    "tpope/vim-unimpaired",
    "lewis6991/spaceless.nvim",

    -- NAVIGATION
    "szw/vim-maximizer",

    -- APPEARANCE
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    "onsails/lspkind.nvim",

    -- GIT PLUGINS
    "tpope/vim-rhubarb",

    -- LATEX
    {
        "lervag/vimtex",
        ft = "tex",
    },

    { "mfussenegger/nvim-jdtls", ft = "java" },

    -- DEBUGGER
    { "rcarriga/cmp-dap", ft = { "python", "cpp", "javascript" } },
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
    { "junegunn/fzf.vim", dependencies = { "junegunn/fzf" } },
}
