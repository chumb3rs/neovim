return {
    "NvChad/nvterm",
    lazy = true,
    keys = {
        { "<leader>ht", ':lua require("nvterm.terminal").toggle "horizontal"<CR>', mode = "n", desc = "Toggle [H]orizontal [T]erminal", silent = true },
        { "<leader>vt", ':lua require("nvterm.terminal").toggle "vertical"<CR>',   mode = "n", desc = "Toggle [V]ertical [T]erminal",   silent = true },
    },
    config = function()
        require("nvterm").setup {
            terminals = {
                shell = vim.o.shell,
                list = {},
                type_opts = {
                    float = {
                        relative = 'editor',
                        row = 0.3,
                        col = 0.25,
                        width = 0.5,
                        height = 0.4,
                        border = "single",
                    },
                    horizontal = { location = "rightbelow", split_ratio = .35 },
                    vertical = { location = "rightbelow", split_ratio = .3 },
                }
            },
            behavior = {
                autoclose_on_quit = {
                    enabled = false,
                    confirm = true,
                },
                close_on_exit = true,
                auto_insert = true,
            },
        }
        local opts = { noremap = true }
        vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
        vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
        vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
        vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
    end

}
