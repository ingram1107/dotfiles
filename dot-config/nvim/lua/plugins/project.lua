return {
  {
    dir = '~/Projects/simple-root.nvim/',
    cmd = 'SimpleRootAuto',
    config = function()
      require('simple-root').setup({
        root_pattern = {
          c = { 'src', 'lib', 'test' },
          cpp = { 'src', 'lib', 'test' },
          rust = { 'src', 'tests' },
          lua = { 'lua', 'plugin', 'after' },
          lisp = { 'src', 'test' },
          vim = { 'after', 'autoload', 'plugin', 'colors', 'ftdetect', 'compiler' },
          css = 'css',
          scss = 'scss',
        },
      })
    end,
  },
  {
    {
      'tpope/vim-projectionist',
      keys = {
        { '<leader>pa', '<cmd>A<cr>' },
        { '<leader>ps', ':AS ' },
        { '<leader>pv', ':AV ' },
        { '<leader>pt', ':AT ' },
        { '<leader>po', ':AO ' },
        { '<leader>pd', '<cmd>AD<cr>' },
      },
    },
    config = function()
      -- projectionist conf
      vim.g.projectionist_heuristics = {
        -- root project
        ['*'] = {
          --- c files
          ['src/*.c'] = {
            alternate = 'lib/{}.h',
            type = 'source',
          },
          ['lib/*.h'] = {
            alternate = {
              'src/{}.c',
              'src/{}.cpp',
            },
            type = 'header',
          },
          ['*.c'] = {
            alternate = '{}.h',
            type = 'source',
          },
          ['*.h'] = {
            alternate = {
              '{}.c',
              '{}.cpp',
            },
            type = 'header',
          },

          --- cpp files
          ['src/*.cpp'] = {
            alternate = {
              'lib/{}.hpp',
              'lib/{}.h',
            },
            type = 'source',
          },
          ['lib/*.hpp'] = {
            alternate = 'src/{}.cpp',
            type = 'header',
          },
          ['*.cpp'] = {
            alternate = {
              '{}.hpp',
              '{}.h',
            },
            type = 'source',
          },
          ['*.hpp'] = {
            alternate = '{}.cpp',
            type = 'header',
          },

          --- rust files
          ['main.rs'] = {
            alternate = 'lib.rs',
            type = 'source',
          },
          ['lib.rs'] = {
            alternate = 'main.rs',
            type = 'library',
          },
          ['*.rs'] = {
            alternate = 'lib.rs',
            type = 'source',
          },
        },
      }
    end,
  },
}
