local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.termguicolors = true

require('lazy').setup({
    change_detection = {
        notify = false
    },
    spec = {
        { import = "plugins" },
        { import = "plugins.ai" },
        { import = "plugins.amazon" },
        { import = "plugins.debug" },
        { import = "plugins.editing" },
        { import = "plugins.git" },
        { import = "plugins.lsp" },
        { import = "plugins.navigation" },
        { import = "plugins.ui" },
        { import = "plugins.utilities" },
    }
})
