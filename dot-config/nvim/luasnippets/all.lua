local newline = require('snippet_utils').newline

return {
  -- normal snippets
  s('date', t(os.date('%Y-%m-%d %H:%M:%S %p %z'))),
  s('gpl', {
    i(1, 'progname'),
    t(' '),
    i(2, 'desc'),
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
    t('*'),
    i(1, 'progname'),
    t('* '),
    i(2, 'desc'),
    newline(''),
    t({
      '',
      'Author: Little Clover',
      'Licese: GPLv3 (see <https://www.gnu.org/licenses/>)',
      '',
      '=============================================================================',
      '*',
    }),
    rep(1),
    t('*'),
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
}, {
  -- auto snippets
}
