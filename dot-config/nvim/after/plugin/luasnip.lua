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
local rep = require("luasnip.extras").rep

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
    s('vh', {
      t('*'), i(1, 'progname'), t('* '), i(2, 'desc'),
      newline(''),
      t({
        '',
        'Author: Little Clover',
        'Licese: GPLv3 (see <https://www.gnu.org/licenses/>)',
        '',
        '=============================================================================',
        '*',
      }), rep(1), t('*'),
      newline(''),
      newline(''),
      i(3, 'Detail desc'),
      newline(''),
      newline(''),
      t({
        '=============================================================================',
        '',
        '  vim:tw=78:ts=8:ft=help:norl:',
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

  c = {
    s('main', {
      t('int main(int argc, char** argv)'),
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
      t('         name='), rep(2),
      newline(''),
      t('         main-class='), rep(4),
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
    }),
    s('tg', {
      t({
        '---',
        'layout:     post',
        'title:      ',
      }), i(1, 'Today\'s title'),
      newline(''),
      t({
        'date:       '..os.date("%Y-%m-%d %H:%M:%S %p %z"),
        'categories: ',
      }), i(2, 'tags'),
      newline('---'),
    }),
  },

  bib = {
    s('nbb', {
      t('@'), i(1, 'book'), t('{'), i(2, 'tag'), t('},'),
      newline('  author = '), t('{'), i(3, 'author'), t('},'),
      newline('  title = '), t('{'), i(4, 'title'), t('},'),
      newline('  date = '), t('{'), i(5, 'date'), t('},'),
      newline('  publisher = '), t('{'), i(6, 'publisher'), t('},'),
      newline('}'),
    })
  },

  tex = {
    s('tp', {
      t({
        '\\documentclass[12pt]{article}',
        '\\usepackage{fontspec}',
        '\\usepackage[T1]{fontenc}',
        '\\usepackage[title]{appendix}',
        '\\usepackage{titlesec}',
        '\\usepackage[bookmarks]{hyperref}',
        '\\usepackage[indent=15pt]{parskip}',
        '\\usepackage{enumitem}',
        '\\usepackage{ctable}',
        '\\usepackage{multirow}',
        '\\usepackage[indent=15pt]{parskip}',
        '\\usepackage{geometry}',
        '\\usepackage{graphicx}',
        '\\usepackage[english]{babel}',
        '\\usepackage[backend=biber,style=',
      }), i(1, 'apa'), t(']{biblatex}'),
      newline(''),
      t({
        '\\usepackage{csquotes}',
        '\\usepackage{siunitx}',
        '\\usepackage{hyperref}',
        '\\DeclareFieldFormat{apacase}{#1}',
        '\\DeclareLanguageMapping{english}{english-apa}',
        '\\addbibresource{',
      }), i(2, 'bib'), t('.bib}'),
      newline(''),
      newline(''),
      t({
        '\\geometry{',
        '  a4paper,',
        '  total={170mm,257mm},',
        '  left=20mm,',
        '  top=20mm,',
        '}',
        '',
        '\\begin{document}',
        '',
        '\\begin{titlepage}',
        '  \\vspace*{\fill}',
        '  \\centering',
        '  \\LARGE ',
      }), i(3, 'Title'), t(' \\par'),
      newline(''),
      t({
        '  \\vspace{1cm}',
        '  \\large Ham Wen Hong \\par',
        '  \\vspace{0.1cm}',
        '  \\large 1171103503 \\par',
        '  \\vspace{0.1cm}',
        '  \\large Multimedia University \\par',
        '  \\vspace{0.5cm}',
        '  \\large ',
      }), i(4, 'Due Date'), t(' \\par'),
      newline(''),
      t({
        '  \\vspace*{\fill}',
        '\\end{titlepage}',
        '',
        '',
      }), i(0),
      newline(''),
      t('\\end{document}'),
    }),
    s('tk', {
      t({
        '\\documentclass[convert={density=200,outext=.png}]{standalone}',
        '\\usepackage{tikz}',
        '\\usepackage{color}',
        '',
        '\\begin{document}',
        '\\begin{tikzpicture}',
        '  ',
      }), i(0),
      newline(''),
      t({
        '\\end{tikzpicture}',
        '\\end{document}',
      }),
    }),
    s('bg', {
      t('\\begin{'), i(1), t('}'), i(0),
      newline(''),
      t('\\end{'), rep(1), t('}'),
    }),
    s('tb', {
      t('\\begin{minipace}{\\textwidth}'),
      newline(''),
      t('\\definecolor{'), i(1, 'LightGray'), t('{gray}{0.95}'),
      newline(''),
      t('\\definecolor{'), i(2, 'DarkGray'), t('{gray}{0.75}'),
      newline('\\bgroup'),
      t('\\setlength{\\tabcolsep{'), i(3, '20pt'), t('}'),
      newline(''),
      t('\\def\\arraystretch{'), i(4, '2'), t('}%'),
      newline(''),
      t('{\\rowcolors{2}{'), rep(1), t('}{'),
      rep(2), t('}'),
      newline(''),
      t('\\begin{tabular}{'), i(5, 'cc'), t('}'),
      newline(''),
      t('  '), i(0),
      newline(''),
      t({
        '\\end{tabular}',
        '}',
        '\\egroup',
        '\\end{minipage}',
      }),
    }),
    s('enr', {
      t({
        '\\begin{enumerate}',
        '  \\item ',
      }), i(0),
      newline(''),
      t('\\end{enumerate}'),
    }),
    s('itz', {
      t({
        '\\begin{itemize}',
        '  \\item ',
      }), i(0),
      newline(''),
      t('\\end{itemize}'),
    }),
    s('dsc', {
      t({
        '\\begin{description}',
        '  \\item[',
      }), i(1), t('] '), i(0),
      newline(''),
      t('\\end{description}'),
    }),
  },
}

ls.config.setup({
  enable_autosnippets = true,
})
