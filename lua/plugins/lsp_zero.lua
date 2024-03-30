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
        { 'j-hui/fidget.nvim',                  event = "VeryLazy", pin = true, version = 'legacy', opts = {} },

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
        lsp.setup()
    end
}
