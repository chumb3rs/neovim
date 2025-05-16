return {
    "ecthelionvi/NeoColumn.nvim",
    lazy = true,
    cmd = "ToggleNeoColumn",
    keys = {
        {
            "<leader>tnc",
            "<cmd>ToggleNeoColumn<CR>",
            mode = "n",
            desc = "[T]oggle [N]eo[C]olumn"
        }
    },
    opts = {
        NeoColumn = "80"
    }
}
