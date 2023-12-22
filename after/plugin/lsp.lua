local lsp = require("lsp-zero")
local mason = require("mason")

lsp.preset("recommended")

mason.setup({})

require("mason-lspconfig").setup({
    ensure_installed = {
        'tsserver',
        'rust_analyzer',
        'eslint',
        --'prettier',
        -- eslint_d
        --'js-debug-adapter',
        'lua_ls',
        --Python
        'pyright',
        --'mypy',
        -- mypy, ruff, black, debugpy
        'clangd',
        --'codelldb'
        --'clang-format'
    },
    handlers = {
        lsp.default_setup,
    }
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = '',
        warn = '',
        hint = '',
        info = ''
    }
})


vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "[G]o to [D]efinition" })
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { desc = "Open IntelliSense menu" })
vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, { desc = "Show [W]orkspace [S]ymbols" })
vim.keymap.set("n", "<leader>of", function() vim.diagnostic.open_float() end, { desc = "[O]pen [F]loat window" })
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "<leader>lca", function() vim.lsp.buf.code_action() end, { desc = "[L]SP [C]ode [A]ctions" })
vim.keymap.set("n", "<leader>lrr", function() vim.lsp.buf.references() end)
vim.keymap.set("n", "<leader>lrn", function() vim.lsp.buf.rename() end, { desc = "[L]SP [R]e[n]ame" })
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
vim.keymap.set("n", 'gD', vim.lsp.buf.declaration)
vim.keymap.set("n", 'gi', vim.lsp.buf.implementation)
vim.keymap.set("n", '<C-k>', vim.lsp.buf.signature_help)
vim.keymap.set("n", '<space>wa', vim.lsp.buf.add_workspace_folder)
vim.keymap.set("n", '<space>wr', vim.lsp.buf.remove_workspace_folder)
vim.keymap.set("n", '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end)
vim.keymap.set("n", '<space>D', vim.lsp.buf.type_definition)
vim.keymap.set("n", '<space>f', function() vim.lsp.buf.format { async = true } end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

-- Auto format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = buffer,
    callback = function()
        vim.lsp.buf.format { async = false }
    end
})
