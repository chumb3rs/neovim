return {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
        { "<leader>ol", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
        outline_window = {
            position = "right",
            width = 25,
            show_numbers = true,
            show_relative_numbers = true,
        },
        outline_items = {
            show_symbol_lineno = true,
        },
    },
}
