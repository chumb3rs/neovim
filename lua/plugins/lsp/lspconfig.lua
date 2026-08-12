-- Runtime configuration -- server configs, keymaps, diagnostics, sign icons --
-- lives in after/plugin/lsp.lua using the native vim.lsp.config API.
--   * nvim-lspconfig ships the default `lsp/<server>.lua` definitions (cmd,
--     root markers, filetypes) that the sparse vim.lsp.config specs extend.
--   * mason-lspconfig auto-installs (ensure_installed) and auto-enables servers.
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
}
