return {
    "ThePrimeagen/refactoring.nvim",
    lazy = true,
    cmd = "Refactor",
    keys = {
        { "<leader>re", ":Refactor extract ",                  mode = "x",          desc = "[R]efactor [E]xtract" },
        { "<leader>rf", ":Refactor extract_to_file ",          mode = "x",          desc = "[R]efactor extract to [F]ile" },
        { "<leader>rv", ":Refactor extract_var<CR>",           mode = "x",          desc = "[R]efactor extract [V]ar" },
        { "<leader>ri", ":Refactor inline_var<CR>",            mode = { "n", "x" }, desc = "[R]efactor [I]nline variable" },
        { "<leader>rI", ":Refactor inline_func<CR>",           mode = "n",          desc = "[R]efactor inline function" },
        { "<leader>rb", ":Refactor extract_block<CR>",         mode = "n",          desc = "[R]efactor extract [B]lock" },
        { "<leader>rB", ":Refactor extract_block_to_file<CR>", mode = "n",          desc = "[R]efactor extract Block to File" },
        {
            "<leader>rr",
            function()
                require("telescope").extensions.refactoring.refactors()
            end,
            mode = { "n", "x" },
            desc = "Open Telescope to Refactor"
        }
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        -- prompt for return type
        prompt_func_return_type = {
            go = true,
            cpp = true,
            c = true,
            java = true,
        },
        -- prompt for function parameters
        prompt_func_param_type = {
            go = true,
            cpp = true,
            c = true,
            java = true,
        },
    }
}
