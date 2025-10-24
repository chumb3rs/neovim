function ColorConfig(color)
    color = color or "tokyonight-night"
    vim.cmd.colorscheme(color)

    local colors = require("tokyonight.colors").setup()
    local util = require("tokyonight.util")

    WindowColors()
    GitSignsColors(colors)
    LineNumberColors(colors, util)
    CursorLineColors()
    IconColors(colors)
    NvimCmpColors(colors)
end

function WindowColors()
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" }) -- Non-current windows
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "MsgArea", { bg = "NONE" })
end

function GitSignsColors(colors)
    vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = colors.green })    -- For added lines
    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = colors.magenta }) -- For changed lines
    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = colors.red }) -- For deleted lines
    vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = colors.cyan }) -- For deleted lines

    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#a9b1d6" })  -- Adjust the color code to your preference
end

function LineNumberColors(colors, util)
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = colors.blue2 })
    vim.api.nvim_set_hl(0, "LineNr", { fg = colors.orange, bold = true })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = util.brighten(colors.magenta2, 0, -0.2) })
end


function CursorLineColors()
    vim.opt.cursorline = true                             -- Enable cursor line
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#292E42" }) -- Set the background color
end

function IconColors(colors)
    vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = colors.red })
    vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = colors.blue })
    vim.api.nvim_set_hl(0, "DapLogPoint", { fg = colors.yellow })
    vim.api.nvim_set_hl(0, "DapStopped", { fg = colors.blue1 })

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

function NvimCmpColors(colors)
    vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough=true, fg=colors.comment })

    vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg=colors.teal })
    vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpIntemAbbrMatch' })

    vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg=colors.blue, fg=colors.bg_dark })
    vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='CmpItemKindVariable' })

    vim.api.nvim_set_hl(0, 'CmpItemKindText', { bg=colors.green, fg=colors.bg_dark })

    vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg=colors.yellow, fg=colors.bg_dark })
    vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })

    vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg=colors.magenta, fg=colors.bg_dark })
    vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link='CmpItemKindKeyword' })
    vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })

    vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { bg=colors.orange, fg=colors.bg_dark })

    vim.api.nvim_set_hl(0, 'CmpItemKindField', { bg=colors.green1, fg=colors.bg_dark })

    vim.api.nvim_set_hl(0, 'CmpItemKindClass', { bg=colors.blue5, fg=colors.bg_dark })
end

ColorConfig()
