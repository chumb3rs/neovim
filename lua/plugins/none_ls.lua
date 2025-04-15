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

                -- Cpp
                null_ls.builtins.formatting.clang_format.with({
                    filetypes = { "c", "cpp", "cs", "cuda", "proto" }
                }),

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

                -- Django
                null_ls.builtins.diagnostics.djlint,
                null_ls.builtins.formatting.djhtml,

                -- Bash
                null_ls.builtins.formatting.shellharden,

                -- Go
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.formatting.goimports_reviser,

                -- Ruby
                null_ls.builtins.formatting.rubocop,
                null_ls.builtins.diagnostics.rubocop,

                -- Code actions
                null_ls.builtins.code_actions.refactoring,
                null_ls.builtins.code_actions.gitsigns,
            }
        })
    end
}
