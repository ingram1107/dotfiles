-- treesitter conf
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'lua',
    'c',
    'cpp',
    'cmake',
    'comment',
    'fish',
    'rust',
    'vim',
    'vimdoc',
    'markdown',
    'latex',
    'query',
    'make',
    'css',
    'html',
    'yaml',
    'python',
    'org'
  },
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = { 'org' },
  },
  incremental_selection = {
    enable = true,
    disable = {},
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false,
  },
  autotag = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['a/'] = '@comment.outer',
      },
    },
    swap = {
      enable = true,
      swap_previous = {
        ['[a'] = '@parameter.inner',
        ['[f'] = '@function.inner',
      },
      swap_next = {
        [']a'] = '@parameter.inner',
        [']f'] = '@function.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
    },
  },
})

vim.g.skip_ts_context_commentstring_module = true
