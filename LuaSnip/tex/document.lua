local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- ...then add `condition=line_begin` to any snippet's `opts` table:
return {

    s({trig = "h1", dscr="Top-level section", snippetType="autosnippet"},
    fmta(
    [[
        \section{<>}
        <>
    ]],
    { i(1), i(0) }
    ), 
    {condition = line_begin}  -- set condition in the `opts` table
    ),

    s({trig = "h2", dscr="Second-level subsection", snippetType="autosnippet"},
    fmta(
    [[
        \subsection{<>}
        <>
    ]],
    { i(1), i(0) }
    ), 
    {condition = line_begin}  -- set condition in the `opts` table
    ),

    s({trig = "h3", dscr="Third-level subsubsubection", snippetType="autosnippet"},
    fmta(
    [[
        \subsubsection{<>}
        <>
    ]],
    { i(1), i(0) }
    ), 
    {condition = line_begin}  -- set condition in the `opts` table
    ),

}
