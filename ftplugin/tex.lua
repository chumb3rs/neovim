-- REMAPS
-- vim.keymap.set("n", "dsm", "<Plug>(vimtex-env-delete-math)")
-- vim.keymap.set("n", "tsm", "<Plug>(vimtex-env-toggle-math)")
-- vim.keymap.set("n", "csm", "<Plug>(vimtex-env-change-math)")

vim.keymap.set("o", "ai", "<Plug>(vimtex-am)")
vim.keymap.set("x", "ai", "<Plug>(vimtex-am)")
vim.keymap.set("o", "ii", "<Plug>(vimtex-im)")
vim.keymap.set("x", "ii", "<Plug>(vimtex-im)")

vim.keymap.set("o", "am", "<Plug>(vimtex-a$)")
vim.keymap.set("x", "am", "<Plug>(vimtex-a$)")
vim.keymap.set("o", "im", "<Plug>(vimtex-i$)")
vim.keymap.set("x", "im", "<Plug>(vimtex-i$)")

-- SETTINGS
vim.g.vimtex_imaps_enabled = 0
vim.g.vimtex_complete_enabled = 1
vim.g.vimtex_syntax_enabled = 0

--[[
" Example: adding `\big` to VimTeX's delimiter toggle list
let g:vimtex_delim_toggle_mod_list = [
  \ ['\left', '\right'],
  \ ['\big', '\big'],
  \]
--]]
