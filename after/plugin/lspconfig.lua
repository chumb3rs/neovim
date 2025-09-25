local configs = require("lspconfig.configs")

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local vue_language_server_path = vim.fn.expand("$MASON/packages/vue-language-server") .. "/node_modules/@vue/language-server"

-- For Bemol integration
function bemol()
    local bemol_dir = vim.fs.find({ ".bemol" }, { upward = true, type = "directory" })[1]
    local ws_folders_lsp = {}
    if bemol_dir then
        local file = io.open(bemol_dir .. "/ws_root_folders", "r")
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

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    "vim",
                    "require",
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
})

vim.lsp.config('ts_ls', {
    init_options = {
        preferences = {
            disableSuggestions = false,
        },
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = vue_language_server_path,
                languages = { "vue" },
            },
        },
    },
    on_attach = function(client)
        -- Makes sure ts_ls does not format ts/js files
        client.server_capabilities.documentFormattingProvider = false
    end,
})

-- Check if the config is already defined (useful when reloading this file)
if not configs.barium then
    configs.barium = {
        default_config = {
            cmd = { "barium" },
            filetypes = { "brazil-config" },
            root_dir = function(fname)
                return vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
            end,
            settings = {},
        },
    }
end

local servers = {
    astro = {},
    barium = {},
    biome = {},
    clangd = {},
    beancount = {
        init_options = {
            journal_file = "/mnt/WIN_D/PROJECTS/beancount/chumbers.beancount",
        },
    },
    emmet_language_server = {
        filetypes = { "html", "javascriptreact", "typescriptreact", "vue", "astro", "svelte" },
    },
    jsonls = {
        settings = {
            json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
            },
        },
        filetypes = { "json" },
    },
    pyright = { filetypes = { "python" } },
    ruby_lsp = {},
    tailwindcss = {},
    volar = {
        init_options = {
            vue = {
                hybridMode = false,
            },
        },
    },
    yamlls = {
        settings = {
            yaml = {
                schemaStore = {
                    -- You must disable built-in schemaStore support if you want to use
                    -- this plugin and its advanced options like `ignore`.
                    enable = false,
                    -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                    url = "",
                },
                schemas = require("schemastore").yaml.schemas(),
            },
        },
        filetypes = { "yaml" },
    },
}

for server, opts in pairs(servers) do
    opts.capabilities = capabilities
    vim.lsp.config(server, opts)
end
