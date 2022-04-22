local newline = require('snippet_utils').newline

return {
  -- normal snippets
  s('fn', {
    t('function '),
    i(1, 'name'),
    t('('),
    i(2),
    t(')'),
    i(0),
    newline('end'),
  }),
  s('tbl', {
    i(1, 'key'),
    t(' = {'),
    newline(''),
    t(''),
    i(0),
    newline('},'),
  }),
},
  {
    -- auto snippets
    s('rels', {
      t({
        'return {',
        '  -- normal snippets',
        '}, {',
        '  -- auto snippets',
        '}',
      }),
    }),
  }
