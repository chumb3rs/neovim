require("symbols-outline").setup({
    auto_close = true
})

vim.keymap.set("n", "<C-S-Right>", "<cmd>:vertical resize -1<cr>", { desc = "Resize window smaller" })
vim.keymap.set("n", "<C-S-Left>", "<cmd>:vertical resize +1<cr>", { desc = "Resize window bigger" })
vim.keymap.set("n", "<C-S-Down>", "<cmd>:horizontal resize -1<cr>", { desc = "Resize window smaller" })
vim.keymap.set("n", "<C-S-Up>", "<cmd>:horizontal resize +1<cr>", { desc = "Resize window bigger" })
vim.keymap.set("n", "<leader>vst", ":SymbolsOutline <cr>", { desc = "Toggle symbol outline" })
