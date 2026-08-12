local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local function brazil_pyright_paths(root)
    if not root then
        return nil
    end
    -- Workspace root is the parent of the package's `src/` dir; fall back to
    -- walking up to whatever ancestor contains an `env/` directory.
    local ws = root:match("^(.*)/src/") or vim.fs.root(root, { "env" })
    if not ws then
        return nil
    end
    local pkg = root:match("/src/([^/]+)")
    local candidates = {}
    if pkg then
        -- Prefer the env matching THIS package.
        table.insert(candidates, ws .. "/env/" .. pkg .. "-*/runtime")
    end
    table.insert(candidates, ws .. "/env/*/runtime")
    for _, glob in ipairs(candidates) do
        local sp = vim.fn.glob(glob .. "/lib/python3*/site-packages", true, true)
        if #sp > 0 then
            local interp = vim.fn.glob(glob .. "/python3*/bin/python", true, true)
            return sp[1], interp[1]
        end
    end
    return nil
end

local servers = {
    astro = {
        on_attach = function(client, bufnr)
            -- disable astro's formatter
            client.server_capabilities.documentFormattingProvider = false
        end,
    },
    barium = {
        cmd = { "barium" },
        root_markers = { "Config" },
        filetypes = { "brazil-config" },
    },
    biome = {},
    clangd = {},
    docker_language_server = {},
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
    lua_ls = {
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
    },
    mdx_analyzer = {},
    pyright = {
        filetypes = { "python" },
        -- `Config` is the Brazil package marker; anchor the root at the package.
        root_markers = { "Config", "pyproject.toml", "setup.py", ".git" },
        before_init = function(_, config)
            local site_packages, interpreter = brazil_pyright_paths(config.root_dir)
            if not site_packages then
                return
            end
            config.settings = vim.tbl_deep_extend("force", config.settings or {}, {
                python = {
                    -- Runtime interpreter for correct stdlib/version.
                    pythonPath = interpreter,
                    analysis = {
                        -- The Brazil closure (boto3, etc.) lives here.
                        extraPaths = { site_packages },
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                        diagnosticMode = "openFilesOnly",
                    },
                },
            })
        end,
    },
    ruby_lsp = {},
    smithy_ls = {},
    tailwindcss = {},
    ts_ls = {
        init_options = {
            preferences = {
                disableSuggestions = false,
            },
        },
        on_attach = function(client)
            -- Makes sure ts_ls does not format ts/js files
            client.server_capabilities.documentFormattingProvider = false
        end,
    },
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

-- barium (the brazil-config LSP from VimBrazilConfig) is not managed by mason,
-- so enable it explicitly. Mason-installed servers are auto-enabled below.
vim.lsp.enable("barium")

-- Mason: install + auto-enable servers. mason-lspconfig v2 calls vim.lsp.enable()
-- for every installed server, applying the vim.lsp.config specs registered above.
require("mason").setup({
    ui = {
        border = "rounded",
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "ts_ls",
        "lua_ls",
        "pyright",
        "clangd",
    },
})

vim.diagnostic.config({
    virtual_text = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
        },
    },
})

-- Diagnostic keymaps (GLOBAL: use vim.diagnostic, so they work in any buffer,
-- including buffers backed only by none-ls linters with no LSP client).
vim.keymap.set("n", "<leader>of", vim.diagnostic.open_float, { desc = "[O]pen [F]loat window" })
vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({ count = 1 })
end, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({ count = -1 })
end, { desc = "Go to previous diagnostic" })

-- LSP keymaps (buffer-local: only bound in buffers with an LSP client attached).
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP buffer-local keymaps",
    callback = function(args)
        local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc })
        end

        map("n", "gd", vim.lsp.buf.definition, "[G]o to [D]efinition")
        map("n", "td", vim.lsp.buf.type_definition, "Go to [T]ype [D]efinition")
        map("n", "gD", vim.lsp.buf.declaration, "[G]o to [D]eclaration")
        map("n", "gi", vim.lsp.buf.implementation, "[G]o to [I]mplementation")
        map("n", "<leader>?", vim.lsp.buf.hover, "Open IntelliSense menu")
        map("i", "g?", vim.lsp.buf.signature_help, "Show signature help")
        map("n", "gs", vim.lsp.buf.signature_help, "Show signature help")
        map("n", "<leader>ws", vim.lsp.buf.workspace_symbol, "Show [W]orkspace [S]ymbols")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "[L]SP [C]ode [A]ctions")
        map("v", "<leader>ca", vim.lsp.buf.code_action, "[L]SP [C]ode [A]ctions")
        map("n", "<leader>lrs", vim.lsp.buf.references, "[L]SP [R]eference[S]")
        map("n", "<leader>lrn", vim.lsp.buf.rename, "[L]SP [R]e[n]ame")
        map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
        map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
        map("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, "List workspace folders")
        map("n", "<leader>fm", function()
            vim.lsp.buf.format({ async = true })
        end, "[F]or[M]at Code")
        map("v", "<leader>fm", function()
            vim.lsp.buf.format({ async = true })
        end, "[F]or[M]at Code Selection")
    end,
})

-- Range formatting operator (gm).
function format_range_operator()
    local old_func = vim.go.operatorfunc
    _G.op_func_formatting = function()
        local start = vim.api.nvim_buf_get_mark(0, "[")
        local finish = vim.api.nvim_buf_get_mark(0, "]")
        vim.lsp.buf.range_formatting({}, start, finish)
        vim.go.operatorfunc = old_func
        _G.op_func_formatting = nil
    end
    vim.go.operatorfunc = "v:lua.op_func_formatting"
    vim.api.nvim_feedkeys("g@", "n", false)
end

vim.api.nvim_set_keymap("n", "gm", "<cmd>lua format_range_operator()<CR>", { noremap = true })

-- Bemol: add first-party workspace source roots (from `.bemol/ws_root_folders`,
-- generated by running the `bemol` CLI in the workspace) so cross-package
-- go-to-definition works. Reads the folder list once per attach and only adds
-- folders the client doesn't already track, avoiding the noisy
-- "<path> is already part of this workspace" messages.
local function bemol_folders()
    local bemol_dir = vim.fs.find({ ".bemol" }, { upward = true, type = "directory" })[1]
    local folders = {}
    if bemol_dir then
        local file = io.open(bemol_dir .. "/ws_root_folders", "r")
        if file then
            for line in file:lines() do
                if line ~= "" then
                    table.insert(folders, line)
                end
            end
            file:close()
        end
    end
    return folders
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client or client.name ~= "pyright" then
            return
        end
        -- Folders the client already tracks (its root_dir, prior bemol adds, etc.)
        local existing = {}
        for _, wf in ipairs(client.workspace_folders or {}) do
            if wf.name then
                existing[wf.name] = true
            end
        end
        for _, folder in ipairs(bemol_folders()) do
            if not existing[folder] then
                vim.lsp.buf.add_workspace_folder(folder)
            end
        end
    end,
})
