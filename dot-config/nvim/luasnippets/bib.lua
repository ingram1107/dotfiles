local newline = require('snippet_utils').newline

return {
  -- normal snippets
}, {
  -- auto snippets
  s('nbb', {
    t('@'),
    i(1, 'book'),
    t('{'),
    i(2, 'tag'),
    t(','),
    newline('  author = '),
    t('{'),
    i(3, 'author'),
    t('},'),
    newline('  title = '),
    t('{'),
    i(4, 'title'),
    t('},'),
    newline('  date = '),
    t('{'),
    i(5, 'date'),
    t('},'),
    newline('  publisher = '),
    t('{'),
    i(6, 'publisher'),
    t('},'),
    newline('}'),
  }),
}
