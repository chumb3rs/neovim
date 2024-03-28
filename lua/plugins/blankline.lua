return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    init = function()
        vim.opt.list = true
        vim.opt.listchars:append "space:⋅"
        vim.opt.listchars:append "eol:↴"
    end,
    opts = {
        indent = {
            char = "┊"
        }
    }
}
