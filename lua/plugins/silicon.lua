return {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    main = "nvim-silicon",
    keys = {
        { "<leader>cs", ":Silicon<cr>", mode = "v", desc = "[C]ode [S]napshot" }
    },
    opts = {
        -- Configuration here, or leave empty to use defaults
        font = "JetBrainsMono Nerd Font=28;Noto Color Emoji=28",
        --background = nil,
        background_image = "/home/chumbers/Pictures/Icons/silicon.png",
        theme = "Dracula",

        window_title = function()
            return vim.fn.fnamemodify(
                vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()),
                ":t"
            )
        end,

        to_clipboard = true

    }
}
