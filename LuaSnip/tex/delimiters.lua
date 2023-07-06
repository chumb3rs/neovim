local tex = require('chumbers.luasnip-helpers')

return {

    -- Autclose delimiters

    s({trig = "\\{", dscr = "Escaped curly braces \\{ ... \\}",  snippetType = "autosnippet"},
    fmta(
    "\\{ <> \\} <>",
    { d(1, tex.get_visual), i(0) }
    )),

    s({trig = "\\l(", dscr = "\\left( ... \\right)",  snippetType = "autosnippet"},
    fmta(
    "\\left( <> \\right) <>",
    { d(1, tex.get_visual), i(0) }
    )),


}
