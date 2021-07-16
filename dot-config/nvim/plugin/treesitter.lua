-- treesitter conf
require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  matchup = {
    enable = true,
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
  rainbow = {
    enable = true,
    extended_mode = true,
    colors = {
      '#f92672',
      '#e6db74',
      '#66d9ef',
      '#a6e221',
      '#2ea6e2',
      '#ae81ff',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['aF'] = '@function.outer',
        ['iF'] = '@function.inner',
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
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
    },
  },
}
