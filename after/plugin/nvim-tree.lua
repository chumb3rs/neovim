local nvimtree = require('nvim-tree')

nvimtree.setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})

local M = {}
local open = false

vim.g.nvim_tree_follow = 1

M.toggle = function()
    nvimtree.toggle()
    if not open then
        nvimtree.find_file(true)
        a = true
    end
end

return M
