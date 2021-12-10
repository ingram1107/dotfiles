-- treesitter conf
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
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
      '#ff6188',
      '#a9dc76',
      '#ffd866',
      '#fc9867',
      '#ab9df2',
      '#78dce8',
    },
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
