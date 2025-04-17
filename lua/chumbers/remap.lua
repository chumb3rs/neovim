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

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>chx", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>yfP", "<cmd>let @+=expand('%:p')<CR>",
    { desc = "[Y]ank [F]ile [P]ath (absolute)" })
vim.keymap.set("n", "<leader>yfp", "<cmd>let @+=@%<CR>",
    { desc = "[Y]ank [F]ile [P]ath (relative)" })
vim.keymap.set("n", "<leader>yfn", "<cmd>let @+=expand('%:t')<CR>",
    { desc = "[Y]ank [F]ile [N]ame" })

vim.keymap.set("n", "<leader><leader>", "<cmd>source %<CR>", { desc = "Source Lua Config" })
-- terminal mode
vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>")

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
vim.keymap.set('n', '<leader>ed', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Opening Tools
vim.keymap.set("n", "<leader>lz", "<cmd>Lazy<CR>", { desc = "Open [L]a[z]y" })
vim.keymap.set("n", "<leader>ms", "<cmd>Mason<CR>", { desc = "Open [M]a[s]on" })
vim.keymap.set("n", "<leader>lsp", "<cmd>LspInfo<CR>", { desc = "Open [LSP]Info" })
vim.keymap.set("n", "<leader>nls", "<cmd>NullLsInfo<CR>", { desc = "Open [N]ull[LS]Info" })


local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = "Open harpoon window" })
vim.keymap.set("n", "<C-s>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window with Telescope" })

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)

vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "[H]arpoon List [1]" })
vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "[H]arpoon List [2]" })
vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "[H]arpoon List [3]" })
vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "[H]arpoon List [4]" })
vim.keymap.set("n", "<leader>h5", function() harpoon:list():select(5) end, { desc = "[H]arpoon List [5]" })
vim.keymap.set("n", "<leader>h6", function() harpoon:list():select(6) end, { desc = "[H]arpoon List [6]" })
vim.keymap.set("n", "<leader>h7", function() harpoon:list():select(7) end, { desc = "[H]arpoon List [7]" })
vim.keymap.set("n", "<leader>h8", function() harpoon:list():select(8) end, { desc = "[H]arpoon List [8]" })
vim.keymap.set("n", "<leader>h9", function() harpoon:list():select(9) end, { desc = "[H]arpoon List [9]" })
vim.keymap.set("n", "<leader>h0", function() harpoon:list():select(0) end, { desc = "[H]arpoon List 1[0]" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>hlp", function() harpoon:list():prev() end, { desc = "[H]arpoon [L]ist [P]revious" })
vim.keymap.set("n", "<leader>hln", function() harpoon:list():next() end, { desc = "[H]arpoon [L]ist [N]ext" })
