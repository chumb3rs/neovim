return {
    "github/copilot.vim",
    version = "1.18.0",
    cmd = "Copilot enable",
    keys = {
        { "<leader>coe", ":Copilot enable<CR>", mode = "n", desc = "Enable GitHub Copilot" }
    },
    init = function()
        vim.g.copilot_no_tab_map = true
        vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
        vim.keymap.set("n", "<leader>cod", ":Copilot disable<CR>", { desc = "Disable GitHub Copilot" })
        vim.g.copilot_filetypes = {
            -- ["*"] = false,
            ["javascript"] = true,
            ["typescript"] = true,
            ["lua"] = false,
            ["rust"] = true,
            ["c"] = true,
            ["c#"] = true,
            ["cpp"] = true,
            ["go"] = true,
            ["python"] = true,
            ["tex"] = true,
        }
    end,
}
