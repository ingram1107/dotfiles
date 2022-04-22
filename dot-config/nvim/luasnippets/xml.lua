local newline = require('snippet_utils').newline

return {
  -- normal snippets
  s('j', {
    t({
      '<?xml version="1.0" encoding="UTF-8"?>',
      '<!-- href attribute contains relative path;',
      '     codebase attribute not specified -->',
      '<jnlp href="',
    }),
    i(1, vim.fn.expand('%')),
    t({
      '">',
      '    <information>',
      '        <title>',
    }),
    i(2, 'Title'),
    t({
      '</title>',
      '        <vendor>',
    }),
    i(3, 'Ingram Ham'),
    t({
      '</vendor>',
      '    </information>',
      '    <resources>',
      '        <!-- Application Resources -->',
      '        <j2se version="1.7+" />',
      '        <jar href=',
      '             ',
    }),
    i(4, 'Main'),
    t({
      '.jar',
      '             main="true" />',
      '    </resources>',
      '    <applet-desc',
      '',
    }),
    t('         name='),
    rep(2),
    newline(''),
    t('         main-class='),
    rep(4),
    t({
      '',
      '         width="500"',
      '         height="500">',
      '     </applet-desc>',
      '     <update check="background"/>',
      '</jnlp>',
    }),
  }),
},
  {
    -- auto snippets
  }
