local newline = require('snippet_utils').newline

return {
  -- normal snippets
  s('main', {
    t('int main(int argc, char** argv)'),
    newline('{'),
    newline(''),
    i(0),
    newline('}'),
  }),
  s('fn', {
    i(1, 'void'),
    t(' '),
    i(2, 'func'),
    t('('),
    i(3),
    t(')'),
    newline('{'),
    newline(''),
    i(0),
    newline('}'),
  }),
}, {
  -- auto snippets
}
