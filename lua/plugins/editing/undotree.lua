return {
    "mbbill/undotree",
    keys = {
        {
            "<leader>u",
            function()
                vim.cmd("UndotreeToggle")
                vim.cmd("UndotreeFocus")
            end,
            mode = "n",
            desc = "Open undo tree"
        }
    }
}
