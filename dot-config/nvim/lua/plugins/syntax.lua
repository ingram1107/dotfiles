return {
  {
    'nvim-treesitter/nvim-treesitter',
    requires = {
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
      -- })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    init = function()
      -- disable entire built-in ftplugin to avoid conflicts
      vim.g.no_plugin_maps = true
    end,
    config = function()
      -- configuration
      require('nvim-treesitter-textobjects').setup({
        select = {
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          -- You can choose the select mode (default is charwise 'v')
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'V', or '<c-v>') or a table
          -- mapping query_strings to modes.
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V', -- linewise
            -- ['@class.outer'] = '<c-v>', -- blockwise
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * selection_mode: eg 'v'
          -- and should return true of false
          include_surrounding_whitespace = true,
        },
        move = {
          -- whether to set jumps in the jumplist
          set_jumps = true,
        },
      })

      -- keymaps
      -- select
      vim.keymap.set({ 'n', 'x', 'o' }, 'af', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@function.outer', 'textobjects')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, 'if', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@function.inner', 'textobjects')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, 'ac', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@class.outer', 'textobjects')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, 'ic', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@class.inner', 'textobjects')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, 'aa', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@parameter.outer', 'textobjects')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, 'ia', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@parameter.inner', 'textobjects')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, 'a/', function()
        require('nvim-treesitter-textobjects.select').select_textobject('@comment.outer', 'textobjects')
      end)

      -- swap
      vim.keymap.set({ 'n', 'x', 'o' }, '[a', function()
        require('nvim-treesitter-textobjects.swap').swap_previous('@parameter.inner')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, ']a', function()
        require('nvim-treesitter-textobjects.swap').swap_next('@parameter.inner')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, '[f', function()
        require('nvim-treesitter-textobjects.swap').swap_previous('@function.inner')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, ']f', function()
        require('nvim-treesitter-textobjects.swap').swap_next('@function.inner')
      end)

      -- move
      -- goto_previous_start
      vim.keymap.set({ 'n', 'x', 'o' }, '[m', function()
        require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer', 'textobjects')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, '[[', function()
        require('nvim-treesitter-textobjects.move').goto_previous_start('@class.outer', 'textobjects')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, '[z', function()
        require('nvim-treesitter-textobjects.move').goto_previous_start('@fold', 'folds')
      end)
      -- goto_previous_end
      vim.keymap.set({ 'n', 'x', 'o' }, '[M', function()
        require('nvim-treesitter-textobjects.move').goto_previous_end('@function.outer', 'textobjects')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, '[]', function()
        require('nvim-treesitter-textobjects.move').goto_previous_end('@class.outer', 'textobjects')
      end)
      -- goto_next_start
      vim.keymap.set({ 'n', 'x', 'o' }, ']m', function()
        require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer', 'textobjects')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, ']]', function()
        require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer', 'textobjects')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, ']z', function()
        require('nvim-treesitter-textobjects.move').goto_next_start('@fold', 'folds')
      end)
      -- goto_next_end
      vim.keymap.set({ 'n', 'x', 'o' }, ']M', function()
        require('nvim-treesitter-textobjects.move').goto_next_end('@function.outer', 'textobjects')
      end)
      vim.keymap.set({ 'n', 'x', 'o' }, '][', function()
        require('nvim-treesitter-textobjects.move').goto_next_end('@class.outer', 'textobjects')
      end)


      local ts_repeat_move = require('nvim-treesitter-textobjects.repeatable_move')

      -- Repeat movement with ; and ,
      -- ensure ; goes forward and , goes backward regardless of the last direction
      vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
      vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)

      -- vim way: ; goes to the direction you were moving.
      -- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
      -- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

      -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
      vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
      vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })
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
