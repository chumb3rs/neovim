vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        local home = os.getenv("HOME")
        local filepath = vim.fn.expand("%:p")

        -- Only apply for files under $HOME
        if not (filepath:match("^" .. home) or filepath:match("^/local" .. home)) then
            return
        end

        -- Skip if already inside a non-bare Git repo
        local handle = io.popen("git rev-parse --is-inside-work-tree 2>/dev/null")
        local result = handle and handle:read("*a") or ""
        if handle then
            handle:close()
        end
        if result:match("^true") then
            return
        end

        -- Set GIT_DIR and GIT_WORK_TREE for Fugitive to work with the bare repo
        vim.env.GIT_DIR = home .. "/.dotfiles"
        vim.env.GIT_WORK_TREE = home
    end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "Config",
    command = "set filetype=brazil-config",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "lombok.config",
    command = "set filetype=lombok",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "mdx",
    callback = function()
        vim.cmd("UltiSnipsAddFiletypes mdx.markdown")
    end,
})

-- Size the Fugitive (:Git) split as a percentage of screen width so it
-- adapts across monitors (wide desktop vs laptop), clamped to sane bounds.
local function git_win_width()
    return math.max(60, math.min(math.floor(vim.o.columns * 0.25), 120))
end

-- Matches any Fugitive-spawned buffer: status (ft=fugitive), log/show (ft=git),
-- and anything else it opens (buffer name always starts with fugitive://).
local function is_fugitive_buf(buf)
    local ft = vim.bo[buf].filetype
    if ft == "fugitive" or ft == "git" then
        return true
    end
    return vim.api.nvim_buf_get_name(buf):match("^fugitive://") ~= nil
end

local function resize_fugitive_windows()
    local target = git_win_width()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if is_fugitive_buf(buf) then
            vim.fn.win_execute(win, "set winfixwidth | vertical resize " .. target)
        end
    end
end

-- Resize when a :Git / :Git log window opens.
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "fugitive", "git" },
    callback = resize_fugitive_windows,
})

-- Re-adjust an already-open :Git window when the terminal/monitor resizes.
vim.api.nvim_create_autocmd("VimResized", {
    callback = resize_fugitive_windows,
})
