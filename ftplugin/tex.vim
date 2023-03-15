noremap <localleader>c <Cmd>update<CR><Cmd>VimtexCompileSS<CR>

" Don't open QuickFix for warning messages if no errors are present
let g:vimtex_quickfix_open_on_warning = 0

" Filter out some compilation warning messages from QuickFix display
let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull \\hbox',
      \ 'Overfull \\hbox',
      \ 'LaTeX Warning: .\+ float specifier changed to',
      \ 'LaTeX hooks Warning',
      \ 'Package siunitx Warning: Detected the "physics" package:',
      \ 'Package hyperref Warning: Token not allowed in a PDF string',
      \]

" Setting custom latexmk compile options
let g:vimtex_compiler_latexmk = {'build_dir': 'build'}

" Setting up Okular
"let g:vimtex_view_general_viewer = 'okular'
"let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

