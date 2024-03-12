local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- Python
        --null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.black,
        -- Cpp
        null_ls.builtins.formatting.clang_format,
        -- JavaScript
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.prettier,
        -- Go
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports_reviser
    }
})
