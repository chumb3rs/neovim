return {
    'SirVer/ultisnips',
    init = function()
        vim.keymap.set("n", "<leader>U", ":call UltiSnips#RefreshSnippets()<CR>", { desc = "Refresh snippets" })
        vim.cmd([[
            let g:UltiSnipsExpandTrigger = "<Tab>"
            let g:UltiSnipsJumpForwardTrigger = "jj"
            let g:UltiSnipsJumpBackwardTrigger = "kk"

            if has('unix')
                let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
            else
                let g:UltiSnipsSnippetDirectories=[$HOME.'/AppData/local/nvim/UltiSnips']
            endif
        ]])
    end
}
