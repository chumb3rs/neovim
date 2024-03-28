return {
    "jay-babu/mason-nvim-dap.nvim",
    cmd = "DapInstall",
    dependencies = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap"
    },
    config = {
        ensure_installed = { "python", "codelldb" },
        automatic_installation = true,
        handlers = {}
    }
}
