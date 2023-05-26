local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
    s({trig="env", dscr="A generic new environmennt", snippetType="autosnippet"},
    fmta(
    [[
    \begin{<>}
        <>
    \end{<>}
    ]],
    {
        i(1),
        i(2),
        rep(1),
    }
    ),
    {condition = line_begin}
    ),

    -- Equation
    s({trig="eq", dscr="Expands 'eq' into an equation environment", snippetType="autosnippet"},
    fmta(
    [[
    \begin{equation*}
        <>
    \end{equation*}
    ]],
    { i(1) }
    ),
    { condition = line_begin }
    )
}
