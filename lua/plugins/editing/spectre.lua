return {
    "nvim-pack/nvim-spectre",
    lazy = true,
    keys = {
        {
            "<leader>Ss",
            '<cmd>lua require("spectre").toggle()<CR>',
            desc = "Toggle Spectre",
        },
        {
            "n",
            "<leader>Sw",
            '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
            desc = "Search current word",
        },
        {
            "<leader>Sw",
            '<esc><cmd>lua require("spectre").open_visual()<CR>',
            desc = "Search current word",
        },
        {
            "n",
            "<leader>Sb",
            '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
            desc = "Search on current file",
        },
    },
}
