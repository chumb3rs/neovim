return {
    "j-hui/fidget.nvim",
    opts = {
        notification = {
            window = {
                border = "rounded",
                border_hl = "FidgetBorder",
                winblend = 0,
                normal_hl = "NormalFloat",
            },
        },
        integration = {
            ["nvim-tree"] = {
                enable = false,
            },
        },
    },
}
