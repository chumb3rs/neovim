return {
    "stevearc/oil.nvim",
    opts = {
        default_file_explorer = true,
        use_default_keymaps = true,
    },
    init = function()
        vim.keymap.set("n", "<leader>pv", ":Oil<cr>", { desc = "Open Oil", silent = true })
        vim.keymap.set("n", "<leader>pt", function()
            vim.cmd("vsplit")
            vim.cmd("wincmd H")
            vim.cmd("Oil")
        end, { desc = "Open Oil in a Vertical Split", silent = true })
        vim.keymap.set("n", "<leader>pc", function()
            vim.cmd("vsplit")
            vim.cmd("wincmd H")
            vim.cmd("Oil .")
        end, { desc = "Open CWD Oil in a Vertical Split", silent = true })
    end,
}
