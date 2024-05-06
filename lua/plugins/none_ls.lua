return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- Python
                null_ls.builtins.diagnostics.pylint,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.usort,
                --
                -- Cpp
                null_ls.builtins.formatting.clang_format,
                --
                -- JavaScript
                null_ls.builtins.formatting.biome.with({
                    filetypes = { "javascript", "typescript",
                        "javascriptreact", "typescriptreact",
                        "json", "jsonc", "vue", "astro" },
                    args = {
                        "check",
                        "--apply",
                        "--formatter-enabled=true",
                        "--organize-imports-enabled=true",
                        "--skip-errors",
                        "$FILENAME"
                    }
                }),

                -- Go
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.formatting.goimports_reviser,

                -- Code actions
                null_ls.builtins.code_actions.refactoring,
                null_ls.builtins.code_actions.gitsigns,
            }
        })
    end
}
