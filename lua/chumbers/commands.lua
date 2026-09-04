-- User commands.

-- :DiffOrig -- diff the current (unsaved) buffer against the file on disk.
-- Lua port of the recipe in `:h difforig`. Opens the on-disk contents in a
-- vertical scratch buffer and diffs it against the live buffer.
vim.api.nvim_create_user_command("DiffOrig", function()
    local ft = vim.bo.filetype
    vim.cmd("vertical new") -- scratch window; original buffer becomes alternate (#)
    vim.bo.buftype = "nofile"
    vim.bo.bufhidden = "wipe"
    vim.cmd("read ++edit #") -- read the saved file's contents
    vim.cmd("0d_") -- delete the leading empty line `read` inserts
    vim.bo.filetype = ft -- match syntax highlighting to the original
    vim.cmd("diffthis")
    vim.cmd("wincmd p") -- back to the original (live) buffer
    vim.cmd("diffthis")
end, { desc = "Diff the current unsaved buffer against the file on disk" })

-- :DiffOff -- inverse of :DiffOrig. Closes the throwaway scratch window(s) the
-- diff created and turns diff mode off in the remaining windows of the tab.
vim.api.nvim_create_user_command("DiffOff", function()
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        if vim.api.nvim_win_is_valid(win) then
            local buf = vim.api.nvim_win_get_buf(win)
            local in_diff = vim.api.nvim_win_call(win, function()
                return vim.wo.diff
            end)
            -- Only the DiffOrig scratch is a nofile buffer in diff mode.
            if in_diff and vim.bo[buf].buftype == "nofile" then
                vim.api.nvim_win_close(win, true)
            end
        end
    end
    vim.cmd("diffoff!") -- clear diff options in the remaining windows
end, { desc = "Turn off diff mode and close any DiffOrig scratch window" })
