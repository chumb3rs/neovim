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
        lsp.preset("recommended")
        lsp.set_sign_icons({
            error = '',
            warn = '',
            hint = '',
            info = ''
        })

        -- REMAPS
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "[G]o to [D]efinition" })
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { desc = "Open IntelliSense menu" })
        vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end,
            { desc = "Show [W]orkspace [S]ymbols" })
        vim.keymap.set("n", "<leader>of", function() vim.diagnostic.open_float() end, { desc = "[O]pen [F]loat window" })
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, { desc = "Go to next diagnostic" })
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, { desc = "Go to previous diagnostic" })
        vim.keymap.set("n", "<leader>lca", function() vim.lsp.buf.code_action() end, { desc = "[L]SP [C]ode [A]ctions" })
        vim.keymap.set("v", "<leader>lca", ":Telescope lsp_range_code_actions<CR>", { desc = "[L]SP [C]ode [A]ctions" })
        vim.keymap.set("n", "<leader>lrr", function() vim.lsp.buf.references() end)
        vim.keymap.set("n", "<leader>lrn", function() vim.lsp.buf.rename() end, { desc = "[L]SP [R]e[n]ame" })
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
        vim.keymap.set("n", 'gD', vim.lsp.buf.declaration)
        vim.keymap.set("n", 'gi', vim.lsp.buf.implementation)
        vim.keymap.set("n", '<C-k>', vim.lsp.buf.signature_help)
        vim.keymap.set("n", '<space>wa', vim.lsp.buf.add_workspace_folder, { desc = "Add folder to current workspace" })
        vim.keymap.set("n", '<space>wr', vim.lsp.buf.remove_workspace_folder)
        vim.keymap.set("n", '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end)
        vim.keymap.set("n", '<leader>td', vim.lsp.buf.type_definition, { desc = "Go to [T]ype [D]efinition" })
        vim.keymap.set("n", '<leader>fm', function() vim.lsp.buf.format { async = true } end,
            { desc = "[F]or[M]at Code" })
        vim.keymap.set("v", '<leader>fm', function() vim.lsp.buf.format { async = true } end,
            { desc = "[F]or[M]at Code Selection" })
        -- REMAPS
        --
        lsp.setup()
    end
}
