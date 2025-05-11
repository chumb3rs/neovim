-- Sets colors to line numbers Above, Current and Below  in this order
function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#A4DFFD' })
    vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white', bold = true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#FDB3BF' })
end

function ColorConfig(color)
    color = color or "tokyonight-night"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" });
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" });
end

function CursorLineConfig()
    vim.opt.cursorline = true                                -- Enable cursor line
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#292E42" }) -- Set the background color
end

function IconConfig()
    -- Define highlight groups with desired colors
    vim.cmd([[
          highlight DapBreakpoint guifg=#FF5555
          highlight DapBreakpointCondition guifg=#61AFEF
          highlight DapLogPoint guifg=#E5C07B
          highlight DapStopped guifg=#98C379
    ]])

    -- Set custom signs with Nerd Font icon
    vim.fn.sign_define('DapBreakpoint', {
        text = '',
        texthl = 'DapBreakpoint',
        linehl = '',
        numhl = ''
    })

    vim.fn.sign_define('DapBreakpointCondition', {
        text = '',
        texthl = 'DapBreakpointCondition',
        linehl = '',
        numhl = ''
    })

    vim.fn.sign_define('DapLogPoint', {
        text = '',
        texthl = 'DapLogPoint',
        linehl = '',
        numhl = ''
    })

    vim.fn.sign_define('DapStopped', {
        text='',
        texthl='DapStopped',
        linehl='DapStopped',
        numhl= 'DapStopped'
    })
end

ColorConfig()
CursorLineConfig()
LineNumberColors()
IconConfig()
