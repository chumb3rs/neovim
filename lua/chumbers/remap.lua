-- File editing
vim.keymap.set("n", "<leader>ef", ":edit ", { desc = "Create new file" })
vim.keymap.set("n", "<leader>cf", "<cmd>let @+ = expand(\"%\")<CR>", { desc = "Copy File Name" })
vim.keymap.set("n", "<leader>cp", "<cmd>let @+ = expand(\"%:p\")<CR>", { desc = "Copy File Path" })

-- Split management
vim.keymap.set("n", "<C-S-Right>", "<cmd>:vertical resize -1<cr>", { desc = "Resize window smaller" })
vim.keymap.set("n", "<C-S-Left>", "<cmd>:vertical resize +1<cr>", { desc = "Resize window bigger" })
vim.keymap.set("n", "<C-S-Down>", "<cmd>:horizontal resize -1<cr>", { desc = "Resize window smaller" })
vim.keymap.set("n", "<C-S-Up>", "<cmd>:horizontal resize +1<cr>", { desc = "Resize window bigger" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join line below" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Center next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Center previous search result" })

vim.keymap.set("n", "<leader>b", ":buffers<CR>:buffer<Space>", { desc = "Switch buffer" })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over selection" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy to clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to black-hole register" })

vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit insert mode" })

vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Open tmux sessionizer" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- terminal mode
vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>")

-- Vim Dispatch
vim.keymap.set("n", "<leader>M", "<cmd>Make<CR>")

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


--------
--LSP
--------
vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "[G]o to [D]efinition" })
vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { desc = "Open IntelliSense menu" })
vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, { desc = "Show [W]orkspace [S]ymbols" })
vim.keymap.set("n", "<leader>of", function() vim.diagnostic.open_float() end, { desc = "[O]pen [F]loat window" })
vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "<leader>lca", function() vim.lsp.buf.code_action() end, { desc = "[L]SP [C]ode [A]ctions" })
vim.keymap.set("n", "<leader>lrr", function() vim.lsp.buf.references() end)
vim.keymap.set("n", "<leader>lrn", function() vim.lsp.buf.rename() end, { desc = "[L]SP [R]e[n]ame" })
vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end)
vim.keymap.set("n", 'gD', vim.lsp.buf.declaration)
vim.keymap.set("n", 'gi', vim.lsp.buf.implementation)
vim.keymap.set("n", '<C-k>', vim.lsp.buf.signature_help)
vim.keymap.set("n", '<space>wa', vim.lsp.buf.add_workspace_folder, { desc = "Add folder to current workspace" })
vim.keymap.set("n", '<space>wr', vim.lsp.buf.remove_workspace_folder)
vim.keymap.set("n", '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end)
vim.keymap.set("n", '<leader>D', vim.lsp.buf.type_definition)
vim.keymap.set("n", '<leader>fm', function() vim.lsp.buf.format { async = true } end)
--------
--LSP
--------


-- Debugging
vim.keymap.set("n", "<leader>dus", function()
    local widgets = require("dap.ui.widgets");
    local sidebar = widgets.sidebar(widgets.scopes);
    sidebar.open();
end, { desc = "Open debugging sidebar" })
vim.keymap.set("n", "<leader>dpr", ":lua require('dap-python').test_method() <CR>", { desc = "Run python test method" })
vim.keymap.set("n", "<leader>dgt", ":lua require('dap-go').debug_test() <CR>", { desc = "Debug Go test" })
vim.keymap.set("n", "<leader>dgl", ":lua require('dap-go').debug_last() <CR>", { desc = "Debug last Go test" })


vim.keymap.set("n", "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
    { desc = "Set conditional breakpoint" })
vim.keymap.set("n", "<leader>bl",
    "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", { desc = "Set log point" })
vim.keymap.set("n", '<leader>br', "<cmd>lua require'dap'.clear_breakpoints()<cr>", { desc = "Clear breakpoints" })
vim.keymap.set("n", '<leader>ba', '<cmd>Telescope dap list_breakpoints<cr>', { desc = "List breakpoints" })

vim.keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", { desc = "Step over" })
vim.keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", { desc = "Step into" })
vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", { desc = "Step out" })
vim.keymap.set("n", '<leader>dd', "<cmd>lua require'dap'.disconnect()<cr>", { desc = "Disconnect" })
vim.keymap.set("n", '<leader>dt', "<cmd>lua require'dap'.terminate()<cr>", { desc = "Terminate" })
--vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "Open REPL" })
vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "Run last" })
vim.keymap.set("n", '<leader>di', function() require "dap.ui.widgets".hover() end, { desc = "Variables" })
vim.keymap.set("n", '<leader>d?', function()
    local widgets = require "dap.ui.widgets"; widgets.centered_float(widgets.scopes)
end, { desc = "Scopes" })
vim.keymap.set("n", '<leader>df', '<cmd>Telescope dap frames<cr>', { desc = "List frames" })
vim.keymap.set("n", '<leader>dh', '<cmd>Telescope dap commands<cr>', { desc = "List commands" })


-----------------------------------------
-- PLUGINS
-----------------------------------------

-- Telescope
local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = "[G]it [F]iles" })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = "[P]roject [S]earch" })

vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(themes.get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[S]earch [B]uffers" })
vim.keymap.set("n", "<leader>sm", builtin.marks, { desc = "[S]earch [M]arks" })
vim.keymap.set("n", "<leader>shm", "<cmd>Telescope harpoon marks<cr>", { desc = "[S]earch [H]arpoon [M]arks" })
vim.keymap.set("n", "<leader>sr", builtin.lsp_references, { desc = "[S]earch LSP [R]eferences" })
vim.keymap.set("n", "<leader>ss", builtin.lsp_document_symbols, { desc = "[S]earch LSP Document [S]ymbols" })
vim.keymap.set("n", "<leader>sc", builtin.lsp_incoming_calls, { desc = "[S]earch LSP Incoming [C]alls" })
vim.keymap.set("n", "<leader>so", builtin.lsp_outgoing_calls, { desc = "[S]earch LSP [O]utgoing Calls" })
vim.keymap.set("n", "<leader>si", builtin.lsp_implementations, { desc = "[S]earch LSP [I]mplementations" })
vim.keymap.set("n", "<leader>sx", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "[S]earch LSP errors" })

-- Git Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" });
vim.keymap.set("n", "<leader>gb", vim.cmd.GBrowse, { desc = "Git browse" });
