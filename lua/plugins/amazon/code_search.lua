return {
    "ibhagwan/fzf-lua",
    keys = {
        {
            "<leader>acs",
            function()
                require("codesearch.fzf").code_search()
            end,
            mode = { "n", "v" },
            silent = true,
            desc = "Amazon Code Search",
        },

        -- Search only in current workspace version set
        {
            "<leader>avs",
            function()
                require("codesearch.fzf").vs_code_search()
            end,
            mode = { "n", "v" },
            silent = true,
            desc = "Amazon Code Search - VersionSet only",
        },
    },
    dependencies = {
        {
            url = "ssh://git.amazon.com/pkg/NvimCodeSearch",
            branch = "mainline",
        },
    },
}
