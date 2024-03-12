local nvimtree = require('nvim-tree')

nvimtree.setup({
    sort_by = "case_sensitive",
    git = {
        enable = true,
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
            show = {
                git = true,
            }
        }
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

-- Remove yellow underlining on files
vim.cmd([[
    :hi! link NvimTreeExecFile NONE
]])

return M
