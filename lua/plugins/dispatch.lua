return {
    'tpope/vim-dispatch',
    lazy = true,
    cmd = "Make",
    keys = {
        { "<leader>mk", "<cmd>Make<CR>", mode = "n", desc = "Run Dispatch Make" }
    }
}
