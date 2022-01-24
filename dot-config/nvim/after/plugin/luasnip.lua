-- luasnip
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local events = require("luasnip.util.events")

--- convenient newline
local function newline(text)
  return t({ '', text })
end

ls.snippets = {
  all = {
    s('date', t(os.date("%Y-%m-%d %H:%M:%S %p %z"))),
    s('gpl', {
      i(1, 'progname'), t(' '), i(2, 'desc'),
      t({
        '',
        'Copyright (C) 2021  Little Clover',
        'This program is free software: you can redistribute it and/or modify',
        'it under the terms of the GNU General Public License as published by',
        'the Free Software Foundation, either version 3 of the License, or',
        '(at your option) any later version.',
        '',
        'This program is distributed in the hope that it will be useful,',
        'but WITHOUT ANY WARRANTY; without even the implied warranty of',
        'MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the',
        'GNU General Public License for more details.',
        '',
        'You should have received a copy of the GNU General Public License',
        'along with this program.  If not, see <https://www.gnu.org/licenses/>',
      }),
    }),
  },

  lua = {
    s('fn', {
      t('function '), i(1, 'name'), t('('), i(2), t(')'),
      i(0),
      newline('end')
    }),
    s('tbl', {
      i(1, 'key'), t(' = {'),
      newline(''),
      t(''), i(0),
      newline('},'),
    }),
  },

  cpp = {
    s('main', {
      t('int main(int argc, char* argv[])'),
      newline('{'),
      i(0),
      newline('}'),
    }),
    s('fn', {
      i(1, 'void'), t(' '), i(2, 'func'), t('('), i(3), t(')'),
      newline('{'),
      i(0),
      newline('}'),
    }),
  },

  xml = {
    s('j', {
      t({
        '<?xml version="1.0" encoding="UTF-8"?>',
        '<!-- href attribute contains relative path;',
        '     codebase attribute not specified -->',
        '<jnlp href="',
      }), i(1, vim.fn.expand('%')),
      t({
        '">',
        '    <information>',
        '        <title>',
      }), i(2, 'Title'),
      t({
        '</title>',
        '        <vendor>',
      }), i(3, 'Ingram Ham'),
      t({
        '</vendor>',
        '    </information>',
        '    <resources>',
        '        <!-- Application Resources -->',
        '        <j2se version="1.7+" />',
        '        <jar href=',
        '             ',
      }), i(4, 'Main'),
      t({
        '.jar',
        '             main="true" />',
        '    </resources>',
        '    <applet-desc',
        '',
      }),
      t('         name='), f(function(args) return args[1] end, {2}),
      newline(''),
      t('         main-class='), f(function(args) return args[1] end, {4}),
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
}

ls.autosnippets = {
  markdown = {
    s('ccby', {
      t({
        '<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img',
        'alt="Creative Commons License" style="border-width:0"',
        'src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is',
        'licensed under a <a rel="license"',
        'href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution',
        '4.0 International License</a>',
      })
    })
  },

  bib = {
    s('nbb', {
      t('@'), i(1, 'book'), t('{'), i(2, 'tag'), t(','),
      newline('  author = '), t('{'), i(3, 'author'), t('}'),
      newline('  title = '), t('{'), i(4, 'title'), t('}'),
      newline('  date = '), t('{'), i(5, 'date'), t('}'),
      newline('  publisher = '), t('{'), i(6, 'publisher'), t('}'),
      newline('}'),
    })
  },
}
