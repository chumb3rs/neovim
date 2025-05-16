-- Sets colors to line numbers Above, Current and Below  in this order
function LineNumberColors()
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#73DACA" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#CFC9C2", bold = true })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#F7768E" })
end

function ColorConfig(color)
    color = color or "tokyonight-night"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" }) -- Non-current windows
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "MsgArea", { bg = "NONE" })

    -- Gitsigns
    vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#9ECE6A" })    -- For added lines
    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#BB9AF7" }) -- For changed lines
    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#F7768E" }) -- For deleted lines
    vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = "#73DACA" }) -- For deleted lines
end

function CursorLineConfig()
    vim.opt.cursorline = true                             -- Enable cursor line
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#292E42" }) -- Set the background color
end

function IconConfig()
    -- Define highlight groups with desired colors
    vim.cmd([[
          highlight DapBreakpoint guifg=#F7768E
          highlight DapBreakpointCondition guifg=#7AA2F7
          highlight DapLogPoint guifg=#E0AF68
          highlight DapStopped guifg=#2AC3De
    ]])

    -- Set custom signs with Nerd Font icon
    vim.fn.sign_define("DapBreakpoint", {
        text = "",
        texthl = "DapBreakpoint",
        linehl = "",
        numhl = "",
    })

    vim.fn.sign_define("DapBreakpointCondition", {
        text = "",
        texthl = "DapBreakpointCondition",
        linehl = "",
        numhl = "",
    })

    vim.fn.sign_define("DapLogPoint", {
        text = "",
        texthl = "DapLogPoint",
        linehl = "",
        numhl = "",
    })

    vim.fn.sign_define("DapStopped", {
        text = "",
        texthl = "DapStopped",
        linehl = "",
        numhl = "",
    })
end

ColorConfig()
CursorLineConfig()
LineNumberColors()
IconConfig()
