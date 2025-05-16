return {
    "glacambre/firenvim",
    build = ":call firenvim#install(0)",
    config = function()
        vim.api.nvim_create_autocmd({ "BufEnter" }, {
            pattern = {"github.com_*.txt", "t.corp.amazon.com_*.txt"},
            command = "set filetype=markdown",
        })

        -- Keymaps specific to Firenvim
        if vim.g.started_by_firenvim == true then
            vim.keymap.set("i", "<D-v>", "<C-R><C-O>+", { desc = "Use Cmd+v to paste" })
        end

        vim.g.firenvim_config = {
            globalSettings = { alt = "all" },
            localSettings = {
                [".*"] = {
                    takeover = "never",
                    cmdline = "neovim",
                },
            },
        }
    end,
}
