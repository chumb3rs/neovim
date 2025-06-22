local utils = require("utils")
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

local lazy_spec = {
    { import = "plugins" },
    { import = "plugins.ai" },
    { import = "plugins.debug" },
    { import = "plugins.editing" },
    { import = "plugins.git" },
    { import = "plugins.lsp" },
    { import = "plugins.navigation" },
    { import = "plugins.ui" },
    { import = "plugins.utilities" },
}

local hostname = utils.get_hostname()
if hostname ~= "marlow" and hostname ~= "CHUMBERS-PC" and hostname ~= "rpi" then -- Load work plugins
    table.insert(lazy_spec, { import = "plugins.amazon" })
end

require("lazy").setup({
    change_detection = {
        notify = false,
    },
    spec = lazy_spec,
})
