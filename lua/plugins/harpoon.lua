return {
    "theprimeagen/harpoon",
    init = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon mark file" })
        --vim.keymap.set("n", "<leader>r", mark.rm_file, { desc="Harpoon remove file"})
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Harpoon toggle menu" })

        vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end, { desc = "Harpoon navigate file 1" })
        vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end, { desc = "Harpoon navigate file 2" })
        vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end, { desc = "Harpoon navigate file 3" })
        vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end, { desc = "Harpoon navigate file 4" })
        vim.keymap.set("n", "<leader>h5", function() ui.nav_file(5) end, { desc = "Harpoon navigate file 5" })
        vim.keymap.set("n", "<leader>h6", function() ui.nav_file(6) end, { desc = "Harpoon navigate file 6" })
    end
}
