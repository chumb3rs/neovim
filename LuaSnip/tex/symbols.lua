local helpers = require('chumbers.luasnip-helpers')
local get_visual = helpers.get_visual

return {
    s({trig = '([^%a])ee', regTrig = true, wordTrig = false},
    fmta(
    "<>e^{<>}",
    {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual)
    }
    )
    ),


    -- Examples of Greek letter snippets, autotriggered for efficiency
    s({trig=";a", snippetType="autosnippet"},
    {
        t("\\alpha"),
    }
    ),
    s({trig=";b", snippetType="autosnippet"},
    {
        t("\\beta"),
    }
    ),
    s({trig=";g", snippetType="autosnippet"},
    {
        t("\\gamma"),
    }
    ),
}
