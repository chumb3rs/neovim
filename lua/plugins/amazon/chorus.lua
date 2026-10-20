return {
    url = "ssh://git.amazon.com/pkg/NvimChorus",
    branch = "mainline",
    cmd = "Chorus",
    event = "BufReadCmd chorus://*",
    opts = {},
    keys = {
        { "<leader>ch", ":Chorus ", mode = "n", desc = "Open [Ch]orus" }
    }
}
