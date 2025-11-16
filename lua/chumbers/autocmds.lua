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
