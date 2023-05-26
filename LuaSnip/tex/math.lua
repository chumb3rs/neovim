local tex  = require('chumbers.luasnip-helpers')

return {

    -- Another take on the fraction snippet without using a regex trigger
    s({trig = "ff", snippetType = "autosnippet"},
    fmta(
    "\\frac{<>}{<>}<>",
    {
        i(1),
        i(2),
        i(0)
    }
    ),
    {condition =tex.in_mathzone}  -- `condition` option passed in the snippet `opts` table 
    ),

    s({trig = "([^%a])mm", wordTrig = false, regTrig = true, snippetType = "autosnippet"},
    fmta(
    "<>$<>$<>",
    {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, tex.get_visual),
        i(0)
    }
    )
    ),

    s({trig = "df", snippetType = "autosnippet"},
    { t("\\diff") },
    { condition = tex.in_mathzone }
    ),
}
