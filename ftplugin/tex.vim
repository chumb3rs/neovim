" A few examples of disabling default VimTeX features.
" The code could go in `ftplugin/tex.vim`.
let g:vimtex_indent_enabled   = 0      " turn off VimTeX indentation
let g:vimtex_imaps_enabled    = 0      " disable insert mode mappings (e.g. if you use UltiSnips)
let g:vimtex_complete_enabled = 0      " turn off completion
let g:vimtex_syntax_enabled   = 0      " disable syntax conceal

" Example: adding `\big` to VimTeX's delimiter toggle list
let g:vimtex_delim_toggle_mod_list = [
  \ ['\left', '\right'],
  \ ['\big', '\big'],
  \]
