return {
    {
        name = 'amazonq',
        url = 'ssh://git.amazon.com/pkg/AmazonQNVim',
        lazy = true,
        cmd = "AmazonQ",
        keys = {
            { "<leader>amh",  ":AmazonQ help<CR>",     mode = "n", desc = "[A]mazon[Q] [H]elp" },
            { "<leader>ame",  ":AmazonQ explain<CR>",  mode = "n", desc = "[A]mazon[Q] [E]xplain" },
            { "<leader>amr",  ":AmazonQ refactor<CR>", mode = "n", desc = "[A]mazon[Q] [R]efactor" },
            { "<leader>amo",  ":AmazonQ optimize<CR>", mode = "n", desc = "[A]mazon[Q] [O]ptimize" },
            { "<leader>amf",  ":AmazonQ fix<CR>",      mode = "n", desc = "[A]mazon[Q] [F]ix" },
            { "<leader>amt",  ":AmazonQ toggle<CR>",   mode = "n", desc = "[A]mazon[Q] [T]oggle" },
            { "<leader>amli", ":AmazonQ login<CR>",    mode = "n", desc = "[A]mazon[Q] [L]og[I]n" },
            { "<leader>amlo", ":AmazonQ logout<CR>",   mode = "n", desc = "[A]mazon[Q] [L]og[O]ut" },
        },
        opts = {
            -- Command passed to `vim.lsp` to start Q LSP. Amazon -- Q LSP is
            -- a NodeJS program, which must be started with `--stdio` flag.
            -- lsp_server_cmd = { 'node', 'path/to/aws-lsp-codewhisperer-token-binary.js', '--stdio' },
            -- IAM Identity Center portal for organisation.
            ssoStartUrl = 'https://view.awsapps.com/start',
            inline_suggest = true,
            -- List of filetypes where the Q will be activated.
            -- Docs: https://docs.aws.amazon.com/amazonq/latest/qdeveloper-ug/q-language-ide-support.html
            -- Note: These must be valid Nvim filetypes. For example, Q supports "shell",
            -- but in the filetype name is "sh" (also "bash").
            filetypes = {
                'amazonq', 'bash', 'java', 'python', 'typescript', 'javascript', 'csharp', 'ruby', 'kotlin', 'sh', 'sql',
                'c',
                'cpp', 'go', 'rust', 'lua',
            },
            -- Window split direction. Default is "vertical", also accepts "horizontal".
            window_direction = 'vertical',
            -- Window width when window_direction=vertical, or height when window_direction=horizontal.
            window_size = '80',
            -- Enable debug mode (for development).
            debug = false,
        },
    },
}
