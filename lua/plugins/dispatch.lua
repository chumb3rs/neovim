return {
    'tpope/vim-dispatch',
    lazy = true,
    cmd = "Make",
    keys = {
        { "<leader>m", ":Make<CR>", mode = "n", desc = "Run Dispatch Make" }
    }
}
