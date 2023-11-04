-- Sets colors to line numbers Above, Current and Below  in this order
function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#B7FFB7', bold = true })
    vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white', bold = true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#BB9AF7', bold = true })
end

function ColorConfig(color)
    color = color or "tokyonight"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" });
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" });

    LineNumberColors()
end

ColorConfig()

require "colorizer".setup()
