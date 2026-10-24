return {
  {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'romgrk/nvim-treesitter-context',
    },
    lazy = 'false',
    run = ':TSUpdate',
    branch = 'main',
    config = function()
      local parsers = {
        'awk',
        'bibtex',
        'c',
        'cmake',
        'comment',
        'cpp',
        'css',
        'csv',
        'diff',
        'dockerfile',
        'fennel',
        'fish',
        'git_config',
        'git_rebase',
        'gitattributes',
        'gitcommit',
        'gitignore',
        'go',
        'html',
        'http',
        'jq',
        'kitty',
        'latex',
        'ledger',
        'lua',
        'luadoc',
        'make',
        'markdown',
        'mermaid',
        'passwd',
        'python',
        'query',
        'regex',
        'rust',
        'ssh_config',
        'terraform',
        'toml',
        'vim',
        'vimdoc',
        'vimdoc',
        'xml',
        'yaml',
        'zig',
      }
      require('nvim-treesitter').install(parsers)
      --   incremental_selection = {
      --     enable = true,
      --     disable = {},
      --   },
      --   playground = {
      --     enable = true,
      --     disable = {},
      --     updatetime = 25,
      --     persist_queries = false,
      --   },
      --   autotag = {
      --     enable = true,
      --   },
      --   textobjects = {
      --     select = {
      --       enable = true,
      --       lookahead = true,
      --       keymaps = {
      --         ['af'] = '@function.outer',
      --         ['if'] = '@function.inner',
      --         ['ac'] = '@class.outer',
      --         ['ic'] = '@class.inner',
      --         ['aa'] = '@parameter.outer',
      --         ['ia'] = '@parameter.inner',
      --         ['a/'] = '@comment.outer',
      --       },
      --     },
      --     swap = {
      --       enable = true,
      --       swap_previous = {
      --         ['[a'] = '@parameter.inner',
      --         ['[f'] = '@function.inner',
      --       },
      --       swap_next = {
      --         [']a'] = '@parameter.inner',
      --         [']f'] = '@function.inner',
      --       },
      --     },
      --     move = {
      --       enable = true,
      --       set_jumps = true,
      --       goto_previous_start = {
      --         ['[m'] = '@function.outer',
      --         ['[['] = '@class.outer',
      --       },
      --       goto_previous_end = {
      --         ['[M'] = '@function.outer',
      --         ['[]'] = '@class.outer',
      --       },
      --       goto_next_start = {
      --         [']m'] = '@function.outer',
      --         [']]'] = '@class.outer',
      --       },
      --       goto_next_end = {
      --         [']M'] = '@function.outer',
      --         [']['] = '@class.outer',
      --       },
      --     },
      --   },
      -- })
    end,
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
  },
  {
    'romgrk/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup({
        max_lines = 3,
      })
    end,
  },
}
