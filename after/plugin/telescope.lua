local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[P]roject [F]iles' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "[G]it [F]iles" })
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = "[P]roject [S]earch" })

vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
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
