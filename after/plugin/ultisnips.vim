" UltiSnips Snippet keys
let g:UltiSnipsExpandTrigger = "<Tab>"
let g:UltiSnipsJumpForwardTrigger = "jj"
let g:UltiSnipsJumpBackwardTrigger = "kk"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']

nnoremap <leader>U :call UltiSnips#RefreshSnippets()<CR>
