-- From any snippet file, source `get_visual` from global helper functions file
local helpers = require('chumbers.luasnip-helpers')

local get_visual = helpers.get_visual

return {
s({trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command.", snippetType="autosnippet"},
  fmta("\\textit{<>} <>",
    {
      d(1, get_visual),
      i(0)
    }
  )
),
s({trig = "tbb", dscr = "Expands 'tbb' into LaTeX's textbf{} command.", snippetType="autosnippet"},
  fmta("\\textbf{<>} <>",
    {
      d(1, get_visual),
      i(0)
    }
  )
),
s({trig = "ttt", dscr = "Expands 'ttt' into LaTeX's texttt{} command.", snippetType="autosnippet"},
  fmta("\\textttt{<>} <>",
    {
      d(1, get_visual),
      i(0)
    }
  )
),
}
