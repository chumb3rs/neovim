return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- Python
                --   E0401 import-error, E0611 no-name-in-module.
                --   W0621 redefined-outer-name
                --   C0114/5/6 missing-module/class/function-docstring
                null_ls.builtins.diagnostics.pylint.with({
                    extra_args = { "--disable=E0401,E0611,W0621,C0114,C0115,C0116" },
                }),
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,

                -- Cpp
                null_ls.builtins.formatting.clang_format.with({
                    filetypes = { "c", "cpp", "cs", "cuda", "proto" },
                }),

                -- JavaScript
                null_ls.builtins.formatting.biome.with({
                    filetypes = {
                        "javascript",
                        "typescript",
                        "javascriptreact",
                        "typescriptreact",
                        "json",
                        "jsonc",
                        "css",
                        "graphql",
                    },
                }),
                null_ls.builtins.formatting.prettier.with({
                    filetypes = {
                        "astro",
                    },
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

                -- Lua
                null_ls.builtins.formatting.stylua,

                -- Zsh
                null_ls.builtins.diagnostics.zsh,
                -- Java
                null_ls.builtins.formatting.google_java_format.with({ extra_args = { "--aosp" } }),

                null_ls.builtins.formatting.xmllint,

                -- Code actions
                null_ls.builtins.code_actions.refactoring,
                null_ls.builtins.code_actions.gitsigns,
            },
        })
    end,
}
