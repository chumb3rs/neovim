return {
    "tpope/vim-fugitive",
    cmd = "Git",
    keys = {
        { "<leader>gs",  "<cmd>vertical Git<CR>", mode = "n", desc = "[G]it [S]tatus" },
        { "<leader>gbr", vim.cmd.GBrowse,         mode = "n", desc = "[G]it [B][R]owse" },
        { "<leader>gbl", "<cmd>Git blame<CR>",    mode = "n", desc = "[G]it [B][L]ame" },
        { "<leader>glg", "<cmd>vert Git log<CR>", mode = "n", desc = "[G]it [L]o[G]" },
        { "<leader>gp",  "<cmd>Git pull<CR>",     mode = "n", desc = "[G]it [P]ull" },
    },
}
