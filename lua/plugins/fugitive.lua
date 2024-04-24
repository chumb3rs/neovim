return {
    "tpope/vim-fugitive",
    cmd = "Git",
    keys = {
        { "<leader>gs", vim.cmd.Git,     mode = "n", desc = "[G]it [S]tatus" },
        { "<leader>gb", vim.cmd.GBrowse, mode = "n", desc = "[G]it [B]rowse" }
    }
}
