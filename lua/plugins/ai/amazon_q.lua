return {
    name = "amazonq",
    url = 'https://github.com/awslabs/amazonq.nvim.git',
    lazy = true,
    cmd = "AmazonQ",
    keys = {
        { "<leader>amh",  ":AmazonQ help<CR>",     mode = "n", desc = "[A]mazon[Q] [H]elp",     silent = true },
        { "<leader>ame",  ":AmazonQ explain<CR>",  mode = "n", desc = "[A]mazon[Q] [E]xplain",  silent = true },
        { "<leader>amr",  ":AmazonQ refactor<CR>", mode = "n", desc = "[A]mazon[Q] [R]efactor", silent = true },
        { "<leader>amo",  ":AmazonQ optimize<CR>", mode = "n", desc = "[A]mazon[Q] [O]ptimize", silent = true },
        { "<leader>amf",  ":AmazonQ fix<CR>",      mode = "n", desc = "[A]mazon[Q] [F]ix",      silent = true },
        { "<leader>amt",  ":AmazonQ toggle<CR>",   mode = "n", desc = "[A]mazon[Q] [T]oggle",   silent = true },
        { "<leader>amli", ":AmazonQ login<CR>",    mode = "n", desc = "[A]mazon[Q] [L]og[I]n",  silent = true },
        { "<leader>amlo", ":AmazonQ logout<CR>",   mode = "n", desc = "[A]mazon[Q] [L]og[O]ut", silent = true },
    },
    opts = {
        ssoStartUrl = "https://view.awsapps.com/start",
        inline_suggest = true,
        on_chat_open = function()
            vim.cmd('vertical topleft split')
            vim.wo.wrap = true
            vim.wo.breakindent = true
            vim.wo.list = false
            vim.wo.number = true
            vim.wo.relativenumber = true
            vim.cmd('vertical resize 100')
        end,
    },
}
