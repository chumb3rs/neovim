return {
    "nvim-pack/nvim-spectre",
    lazy = true,
    keys = {
        {
            "<leader>S",
            '<cmd>lua require("spectre").toggle()<CR>',
            desc = "Toggle Spectre",
        },
        {
            "n",
            "<leader>sw",
            '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
            desc = "Search current word",
        },
        {
            "<leader>sw",
            '<esc><cmd>lua require("spectre").open_visual()<CR>',
            desc = "Search current word",
        },
        {
            "n",
            "<leader>sp",
            '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
            desc = "Search on current file",
        },
    },
}
