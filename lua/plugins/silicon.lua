return {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    keys = {
        { "<leader>cs", "<cmd>Silicon<cr>", mode = "x", desc = "[C]ode [S]napshot" }
    },
    config = {
        -- Configuration here, or leave empty to use defaults
        font = "JetBrainsMono Nerd Font=28;Noto Color Emoji=28",
        --background = nil,
        background_image = "/home/chumbers/Pictures/Icons/silicon.png",
        theme = "Monokai Extended",

        window_title = function()
            return vim.fn.fnamemodify(
                vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()),
                ":t"
            )
        end,

        to_clipboard = true
    }
}
