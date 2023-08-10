" UltiSnips Snippet keys
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "jj"
let g:UltiSnipsJumpBackwardTrigger = "kk"

if has('unix')
    let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']
else
    let g:UltiSnipsSnippetDirectories=[$HOME.'/AppData/local/nvim/UltiSnips']
endif

nnoremap <leader>U :call UltiSnips#RefreshSnippets()<CR>
