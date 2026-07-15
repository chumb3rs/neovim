return {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPost", "BufNewFile" }, -- lazy-load on file open
    build = ':TSUpdate',
    dependencies = { 'neovim-treesitter/treesitter-parser-registry' },
}
