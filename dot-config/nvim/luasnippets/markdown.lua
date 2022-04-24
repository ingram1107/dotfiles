local newline = require('snippet_utils').newline

return {
  -- normal snippets
},
  {
    -- auto snippets
    s('ccby', {
      t({
        '<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img',
        'alt="Creative Commons License" style="border-width:0"',
        'src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is',
        'licensed under a <a rel="license"',
        'href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution',
        '4.0 International License</a>',
      }),
    }),
    s('tg', {
      t({
        '---',
        'layout:     post',
        'title:      ',
      }),
      i(1, "Today's title"),
      newline(''),
      t({
        'date:       ' .. os.date('%Y-%m-%d %H:%M:%S %p %z'),
        'categories: ',
      }),
      i(2, 'tags'),
      newline('---'),
    }),
    s('zkt', {
      t({
        '---',
        'title: ',
      }),
      i(1, "Book's Title"),
      newline('authors: '),
      i(2, "Book's Author"),
      newline('year: '),
      i(3, os.date('%Y')),
      newline('date: ' .. os.date('%Y-%m-%d %H:%M')),
      newline('tags: [literature, '),
      i(5, 'philosophy, socialism'),
      t(']'),
      newline('---'),
    }),
  }
