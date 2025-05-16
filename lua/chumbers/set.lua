vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.numberwidth = 4

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.fillchars = { eob = ' ' }

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes:3" -- Reserve 3 columns for signs
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "60"

vim.opt.shell = "zsh"
vim.opt.shellcmdflag = "-c"
vim.g.netrw_localrmdir = "rm -r"
vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_keepdir = 0

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.completeopt = "menuone,noselect"

vim.opt.guifont = "JetBrainsMono Nerd Font"
