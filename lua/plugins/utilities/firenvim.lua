return {
    "glacambre/firenvim",
    build = ":call firenvim#install(0)",
    config = function()
        -- Keymaps specific to Firenvim
        if vim.g.started_by_firenvim == true then
            vim.keymap.set("i", "<D-v>", "<C-R><C-O>+", { desc = "Use Cmd+v to paste" })
            vim.api.nvim_create_autocmd('FileType', {
                pattern = 'text',
                callback = function()
                    vim.bo.filetype = 'markdown'
                end
            })
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
