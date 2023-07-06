noremap <localleader>c <Cmd>update<CR><Cmd>VimtexCompileSS<CR>

nnoremap <leader>L <Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})<CR>

" Don't open QuickFix for warning messages if no errors are present
let g:vimtex_quickfix_open_on_warning = 0

" Filter out some compilation warning messages from QuickFix display
let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull \\hbox',
      \ 'Overfull \\hbox',
      \ 'LaTeX Warning: .\+ float specifier changed to',
      \ 'LaTeX Warning: You have requesed document class',
      \ 'LaTeX hooks Warning',
      \ 'Package siunitx Warning: Detected the "physics" package:',
      \ 'Package hyperref Warning: Token not allowed in a PDF string',
      \]

" Setting custom latexmk compile vimtex_view_general_options
let g:vimtex_compiler_latexmk = {
        \ 'callback' : 1,
        \ 'executable' : 'latexmk',
        \ 'hooks' : [],
        \ 'options' : [
        \   '-shell-escape',
        \   '-verbose',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \ 'build_dir' : 'build',
        \}

" Setting up SumatraPDF
"let g:vimtex_view_general_viewer = 'SumatraPDF'
"let g:vimtex_view_method = 'SumatraPDF'
"let g:vimtex_view_general_options
"            \ = '-reuse-instance -forward-search @tex @line @pdf'

" Setting up Zathura
let g:vimtex_view_method = 'zathura'
