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
ls.add_snippets('ruby', {
  s('frozen', fmt('# frozen_string_literal: true{}', { i(0) })),
})

ls.add_snippets('eruby', {
  s('comment', fmt('<%# {} %>', { i(0) })),
  s('output', fmt('<%= {} %>', { i(0) })),
  s('execute', fmt('<% {} %>', { i(0) })),
  s('if', fmt('<% if {} %>\n  {}\n<% end %>', { i(1, 'condition'), i(0) })),
  s('ife', fmt('<% if {} %>\n  {}\n<% else %>\n  {}\n<% end %>', { i(1, 'condition'), i(2), i(0) })),
  s('elsif', fmt('<% elsif {} %>\n  {}', { i(1, 'condition'), i(0) })),
  s('unless', fmt('<% unless {} %>\n  {}\n<% end %>', { i(1, 'condition'), i(0) })),
  s('each', fmt('<% {}.each do |{}| %>\n  {}\n<% end %>', { i(1, 'collection'), i(2, 'item'), i(0) })),
  s('eachidx', fmt('<% {}.each_with_index do |{}, {}| %>\n  {}\n<% end %>', { i(1, 'collection'), i(2, 'item'), i(3, 'index'), i(0) })),
  s('link', fmt('<%= link_to "{}", {} %>', { i(1, 'text'), i(0, 'path') })),
  s('form', fmt('<%= form_with {} do |f| %>\n  {}\n<% end %>', { i(1, 'model: @model'), i(0) })),
  s('submit', fmt('<%= f.submit "{}", class: "{}" %>', { i(1, 'Submit'), i(0, 'btn btn-primary') })),
  s('field', fmt('<%= f.{} :{}, class: "{}" %>', { i(1, 'text_field'), i(2, 'attribute'), i(0, 'form-control') })),
  s('label', fmt('<%= f.label :{}, "{}" %>', { i(1, 'attribute'), i(0, 'Label') })),
  s('render', fmt('<%= render "{}" %>', { i(0, 'partial') })),
  s('renderw', fmt('<%= render "{}", {}: {} %>', { i(1, 'partial'), i(2, 'locals'), i(0, '@variable') })),
  s('content', fmt('<%= content_tag :{}, {} do %>\n  {}\n<% end %>', { i(1, 'div'), i(2, 'class: "class-name"'), i(0) })),
  s('image', fmt('<%= image_tag "{}", alt: "{}" %>', { i(1, 'path'), i(0, 'description') })),
})
