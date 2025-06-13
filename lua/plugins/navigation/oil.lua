return {
    "stevearc/oil.nvim",
    opts = {
        default_file_explorer = true,
        use_default_keymaps = false,
        columns = {
            "icon",
            "permissions",
            "size",
            "mtime",
        },
        constrain_cursor = "name",
        keymaps = {
            ["g?"] = { "actions.show_help", mode = "n" },
            ["<CR>"] = "actions.select",
            ["<C-s>"] = { "actions.select", opts = { vertical = true } },
            ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
            ["<C-t>"] = { "actions.select", opts = { tab = true } },
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = { "actions.close", mode = "n" },
            ["<C-L>"] = "actions.refresh",
            ["-"] = { "actions.parent", mode = "n" },
            ["_"] = { "actions.open_cwd", mode = "n" },
            ["`"] = { "actions.cd", mode = "n" },
            ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
            ["gs"] = { "actions.change_sort", mode = "n" },
            ["gx"] = "actions.open_external",
            ["g."] = { "actions.toggle_hidden", mode = "n" },
            ["g\\"] = { "actions.toggle_trash", mode = "n" },
        },
    },
    init = function()
        vim.keymap.set("n", "<leader>pv", ":Oil<cr>", { desc = "Open Oil", silent = true })
        vim.keymap.set("n", "<leader>pt", function()
            vim.cmd("vsplit")
            vim.cmd("wincmd H")
            vim.cmd("Oil")
        end, { desc = "Open Oil in a Vertical Split", silent = true })
        vim.keymap.set("n", "<leader>pc", function()
            vim.cmd("vsplit")
            vim.cmd("wincmd H")
            vim.cmd("Oil .")
        end, { desc = "Open CWD Oil in a Vertical Split", silent = true })
    end,
    config = function()
        -- Declare the global function first
        function _G.get_oil_winbar()
            local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
            local dir = require("oil").get_current_dir(bufnr)
            if dir then
                return vim.fn.fnamemodify(dir, ":~")
            else
                -- If there is no current directory (e.g. over ssh), just show the buffer name
                return vim.api.nvim_buf_get_name(0)
            end
        end

        -- Then setup oil
        require("oil").setup({
            win_options = {
                winbar = "%!v:lua.get_oil_winbar()",
            },
        })
    end,
}
