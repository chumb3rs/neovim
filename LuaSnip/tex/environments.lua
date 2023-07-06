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
    )
    ),

    -- Equation
    s({trig="eq", dscr="Expands 'eq' into an equation environment", snippetType="autosnippet"},
    fmta(
    [[
    \begin{equation}
        <>
    \end{equation}
    <>
    ]],
    { i(1), i(0) }
    ),
    { condition = line_begin }
    ),

    s({trig="nn", dscr="Expands 'nn' into a starred equation environment", snippetType="autosnippet"},
    fmta(
    [[
    \begin{equation*}
        <>
    \end{equation*}
    <>
    ]],
    { i(1), i(0) }
    ),
    { condition = line_begin }
    ),

    s({trig="all", dscr="Starred align environment", snippetType="autosnippet"},
    fmta(
    [[
    \begin{align*}
        <>
    \end{align*}
    <>
    ]],
    { i(1), i(0) }
    ),
    { condition = line_begin }
    ),

    s({ trig="rit", dscr = "Reverse itemized env, use to split up existing", snippetType="autosnippet"},
    fmta(
    [[
        \end{itemize}


        <>
        \begin{itemize}
    ]],
    { i(1) }
    )),

    s({ trig="itt", dscr="Itemized environment", snippetType="autosnippet"},
    fmta(
    [[
        \begin{itemize}
            \item <>
        \end{itemize}
    ]],
    { i(1) }
    )),
}
