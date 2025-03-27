local lsp = require("lsp-zero")
local mason = require("mason")
local lspconfig = require("lspconfig")

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        'ts_ls',
        'rust_analyzer',
        --'eslint',
        --'prettier',
        --'eslint_d',
        --'js-debug-adapter',
        'lua_ls',
        --Python
        'pyright',
        --'mypy',
        -- mypy, ruff, black, debugpy
        'clangd',
        --'clang-format'
        -- 'gopls'
    },
    handlers = {
        lsp.default_setup,

        gopls = function()
            lspconfig.gopls.setup({
                --root_dir = util.root_pattern("go.work", "go.mod", ".git"),
                settings = {
                    gopls = {
                        usePlaceholders = true,
                        staticcheck = true,
                        gofumpt = true,
                        analyses = {
                            unusedparams = true
                        }
                    }
                }
            })
        end,
    }
})

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

-- For Bemol integration
function bemol()
    local bemol_dir = vim.fs.find({ '.bemol' }, { upward = true, type = 'directory' })[1]
    local ws_folders_lsp = {}
    if bemol_dir then
        local file = io.open(bemol_dir .. '/ws_root_folders', 'r')
        if file then
            for line in file:lines() do
                table.insert(ws_folders_lsp, line)
            end
            file:close()
        end
    end

    for _, line in ipairs(ws_folders_lsp) do
        vim.lsp.buf.add_workspace_folder(line)
    end
end

bemol()
