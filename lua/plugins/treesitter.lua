return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false, -- FileType autocmd below must exist before the first file's FileType fires
    build = ":TSUpdate",
    dependencies = { "neovim-treesitter/treesitter-parser-registry" },
    config = function()
        require("nvim-treesitter").install({
            "typescript",
            "tsx",
            "javascript",
            "python",
            "java",
            "lua",
            "json",
            "yaml",
            "bash",
            "markdown",
            "markdown_inline",
        })

        -- On the main branch nvim-treesitter no longer enables highlighting for us
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
            end,
        })
    end,
}
