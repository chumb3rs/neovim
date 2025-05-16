return {
    "leoluz/nvim-dap-go",
    lazy = true,
    ft = "go",
    keys = {
        { "<leader>dgt", ":lua require('dap-go').debug_test() <CR>", mode = "n", desc = "Debug Go test" },
        { "<leader>dgl", ":lua require('dap-go').debug_last() <CR>", mode = "n", desc = "Debug last Go test" }
    },
    dependencies = {
        "mfussenegger/nvim-dap"
    },
}
