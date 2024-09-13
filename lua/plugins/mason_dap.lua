return {
    "jay-babu/mason-nvim-dap.nvim",
    -- cmd = { "DapIntall", "DapContinue" },
    dependencies = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap"
    },
    opts = {
        ensure_installed = { "python", "codelldb" },
        automatic_installation = true,
        handlers = {}
    }
}
