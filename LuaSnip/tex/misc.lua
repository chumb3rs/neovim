local helpers = require('chumbers.luasnip-helpers')
local in_tikz = helpers.in_tikz

return {
    -- Example use of insert node placeholder text
    s({trig="hr", dscr="The hyperref package's href{}{} command (for url links)"},
    fmta(
    [[\href{<>}{<>}]],
    {
        i(1, "url"),
        i(2, "display name"),
    }
    )
    ),

    -- Expand 'dd' into \draw, but only in TikZ environments
    s({trig = "dd", snippetType = "autosnippet"},
    fmta(
    "\\draw [<>] ",
    {
        i(1, "params"),
    }
    ),
    { condition = in_tikz }
    ),
}
