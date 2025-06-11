return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },             -- Required
        { 'williamboman/mason.nvim' },           -- Optional
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },                    -- Required
        { 'hrsh7th/cmp-nvim-lsp' },                -- Required
        { 'hrsh7th/cmp-nvim-lsp-signature-help' }, -- Optional
        { 'hrsh7th/cmp-buffer' },                  -- Optional
        { 'hrsh7th/cmp-path' },                    -- Optional
        { 'felipelema/cmp-async-path' },
        { 'saadparwaiz1/cmp_luasnip' },            -- Optional
        { 'quangnguyen30192/cmp-nvim-ultisnips' },
        { 'hrsh7th/cmp-nvim-lua' },                -- Optional

        -- Snippets
        { 'L3MON4D3/LuaSnip' },             -- Required
        { 'rafamadriz/friendly-snippets' }, -- Optional

        -- Useful status updates
        { 'j-hui/fidget.nvim' },

    },
    config = function()
        local lsp = require("lsp-zero")
        lsp.set_sign_icons({
            error = '',
            warn = '',
            hint = '',
            info = ''
        })

        -- REMAPS
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]o to [D]efinition" })
        vim.keymap.set("n", 'td', vim.lsp.buf.type_definition, { desc = "Go to [T]ype [D]efinition" })
        vim.keymap.set("n", 'gD', vim.lsp.buf.declaration)
        vim.keymap.set("n", 'gi', vim.lsp.buf.implementation, { desc = "[G]o to [I]mplementation" })
        vim.keymap.set("n", "<leader>?", vim.lsp.buf.hover, { desc = "Open IntelliSense menu" })
        vim.keymap.set("i", "gs",  vim.lsp.buf.signature_help, { desc = "Show signature help" })
        vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { desc = "Show signature help" })
        vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, { desc = "Show [W]orkspace [S]ymbols" })
        vim.keymap.set("n", "<leader>of", vim.diagnostic.open_float, { desc = "[O]pen [F]loat window" })
        vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Go to next diagnostic" })
        vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Go to previous diagnostic" })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[L]SP [C]ode [A]ctions" })
        vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, { desc = "[L]SP [C]ode [A]ctions" })
        vim.keymap.set("n", "<leader>lrs", vim.lsp.buf.references, { desc = "[L]SP [R]eference[S]" })
        vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, { desc = "[L]SP [R]e[n]ame" })
        vim.keymap.set("n", '<space>wa', vim.lsp.buf.add_workspace_folder, { desc = "Add folder to current workspace" })
        vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove folder from workspace" })
        vim.keymap.set("n", '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end)
        vim.keymap.set("n", '<leader>fm', function() vim.lsp.buf.format { async = true } end,
            { desc = "[F]or[M]at Code" })
        vim.keymap.set("v", '<leader>fm', function() vim.lsp.buf.format { async = true } end,
            { desc = "[F]or[M]at Code Selection" })
        -- REMAPS
        --
        lsp.setup()
    end
}
