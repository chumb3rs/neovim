local lspconfig = require('lspconfig')
local util = require "lspconfig/util"

local servers = { clangd = {} }
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

for server, opts in pairs(servers) do
    opts.capabilities = capabilities
    lspconfig[server].setup(opts)
end

lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    'vim',
                    'require'
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

local function organize_imports()
    local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) }
    }
    vim.lsp.buf.execute_command(params)
end

lspconfig.tsserver.setup({
    init_options = {
        preferences = {
            disableSuggestions = true
        }
    },
    on_attach = function(_, _)
        vim.api.nvim_create_user_command("OrganizeImports", organize_imports, { desc = "Organize imports" })
    end
})

vim.keymap.set("n", "<leader>oi", "<cmd> OrganizeImports <CR>", { desc = "Organize imports" })
