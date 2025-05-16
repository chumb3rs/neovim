return {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    lazy = "true",
    keys = {
        { "<leader>dpr", ":lua require('dap-python').test_method()<CR>", mode = "n", desc = "Run python test method" }
    },
    dependencies = {
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui"
    },
    config = function()
        local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
        require("dap-python").setup(path)
    end
}
