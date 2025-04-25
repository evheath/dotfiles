local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
-- given the index of the node, return its same result
local same = function(index)
  return f(function(arg)
    return arg[1]
  end, { index })
end
local fmt = require('luasnip.extras.fmt').fmt

-- NOTE: i(0) means exit, otherwise i(1) means first, i(2) means second etc
-- NOTE: to escape curlies, use {{ or }}
-- NOTE: multiline strings start and end with [[ and ]]
ls.add_snippets('go', {
  s(
    'switch',
    fmt(
      [[
  switch {} {{
    case {}:
      {}
    default:
    {}
  }} {}
  ]],
      { i(1), i(2), i(3), i(4), i(0) }
    )
  ),
  s('log', fmt('log.Printf("{}:%v\\n", {}){}', { same(1), i(1), i(0) })),
  s(
    'forr',
    fmt(
      [[
  for {} , {} := range {} {{
    log.Printf("{}[%v]:%v\n", {}, {})
    {}
  }} {}
  ]],
      { i(2, 'index'), i(3, 'value'), i(1, 'slice'), same(1), same(2), same(3), i(4), i(0) }
    )
  ),
  s(
    'fori',
    fmt(
      [[
  for {}:={} ; i {} {}; i++ {{
    {}
  }}
  ]],
      { i(1, 'i'), i(2, '0'), i(3, '<'), i(4, 'len(something)'), i(0) }
    )
  ),
})
