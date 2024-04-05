local lspconfig = require('lspconfig')

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local mason_registry = require('mason-registry')
local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() ..
    '/node_modules/@vue/language-server'

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

-- lspconfig.tsserver.setup({
--     init_options = {
--         preferences = {
--             disableSuggestions = false
--         },
--         plugins = {
--             name = '@vue/typescript-plugin',
--             location = vue_language_server_path,
--             languages = { 'vue' }
--         }
--     },
--     filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
-- })

lspconfig.tsserver.setup {
    init_options = {
        preferences = {
            disableSuggestions = false
        },
        plugins = {
            {
                name = '@vue/typescript-plugin',
                location = vue_language_server_path,
                languages = { 'vue' },
            },
        },
    },
    on_attach = function(client)
        -- Makes sure tsserver does not format ts/js files
        client.server_capabilities.documentFormattingProvider = false
    end
}

lspconfig.pyright.setup({
    filetypes = { "python" }
})

local servers = {
    clangd = {},
    astro = {},
    biome = {},
    volar = {
        init_options = {
            vue = {
                hybridMode = false
            }
        }
    },
    emmet_language_server = {
        filetypes = { "html", "javascriptreact", "typescriptreact", "vue", "astro", "svelte" }
    }
}

for server, opts in pairs(servers) do
    opts.capabilities = capabilities
    lspconfig[server].setup(opts)
end
