return {
    "nvim-tree/nvim-tree.lua",
    cmd = "NvimTreeOpen",
    keys = {
        { "<leader>pv", ":NvimTreeFindFile<cr>", mode = "n", desc = "Explorer tree" },
        { "<leader>pt", ":NvimTreeToggle<cr>",   mode = "n", desc = "Explorer tree toggle" },
        { "<leader>pc", ":NvimTreeCollapse<cr>", mode = "n", desc = "Explorer tree collapse" },
    },
    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
    config = function()
        require("nvim-tree").setup {
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
        }

        vim.g.nvim_tree_follow = 1
        vim.cmd([[
            :hi! link NvimTreeExecFile NONE
        ]])
    end
}
