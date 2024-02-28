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
}, {
  -- auto snippets
  s('fn', {
    t({
      "/**",
      " * ",
    }),
    i(4, "Description"),
    newline(''),
    t(' *'),
    newline(''),
    f(function (args, parent, user_args)
      if args[1][1] == "void" then
        return ""
      else
        return " * @return " .. args[1][1]
      end
    end, {1}, {}),
    t(' */'),
    newline(''),
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
  s('ifndef', {
    t({
      '#ifndef ' .. string.upper(vim.fn.expand('%:t:r') .. '_h'),
      '#define ' .. string.upper(vim.fn.expand('%:t:r') .. '_h'),
    }),
    newline(''),
    newline(''),
    i(0),
    newline(''),
    newline(''),
    t('#endif'),
  }),
}
