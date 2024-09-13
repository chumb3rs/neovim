compiler tex

noremap <localleader>c <Cmd>update<CR><Cmd>VimtexCompileSS<CR>

map <leader>i :VimtexInfo<CR>

" Disabling some default features
let g:vimtex_indent_enabled = 0          " turn off vimtex indentation
let g:vimtex_mappings_enabled = 0        " disable default mappings
let g:vimtex_imaps_enabled = 0           " disable insert mode mappings (I use UltiSnips)
let g:vimtex_complete_enabled = 0        " turn off completion (not currently used so more efficient to turn off)
let g:vimtex_syntax_conceal_disable = 1  " disable syntax conceal

" Default is 500 lines and gave me lags on missed key presses
" let g:vimtex_delim_stopline = 5

" vimtex toggle delimeter configuration
" ------------------------------- "
let g:vimtex_delim_toggle_mod_list = [
  \ ['\left', '\right'],
  \ ['\big', '\big'],
  \]

" Don't open quickfix for warning messages if no errors are present
let g:vimtex_quickfix_open_on_warning = 0  

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
        \ 'out_dir' : 'build',
        \ 'aux_dir' : 'aux'
        \}

" Disable some compilation warning messages
let g:vimtex_quickfix_ignore_filters = [
      \ 'LaTeX hooks Warning',
      \ 'Underfull \\hbox',
      \ 'Overfull \\hbox',
      \ 'LaTeX Warning: .\+ float specifier changed to',
      \ 'Package siunitx Warning: Detected the "physics" package:',
      \ 'Package hyperref Warning: Token not allowed in a PDF string',
      \]

if has('unix')
  let g:vimtex_view_method = 'zathura'
else
  echom "Error: forward show not supported on this OS"
endif

