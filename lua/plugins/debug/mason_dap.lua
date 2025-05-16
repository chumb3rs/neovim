return {
    "jay-babu/mason-nvim-dap.nvim",
    cmd = { "DapInstall", "DapContinue" },
    dependencies = {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap"
    },
    opts = {
        ensure_installed = { "python" },
        automatic_installation = true,
        handlers = {}
    }
}
