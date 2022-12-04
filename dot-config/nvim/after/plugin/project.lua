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

-- origin conf
require('origin').setup({
  default_source = {
    c = { 'src', 'lib', 'test' },
    cpp = { 'src', 'lib', 'test' },
    rust = { 'src', 'tests' },
    lua = { 'lua', 'plugin', 'after' },
    lisp = { 'src', 'test' },
    vim = { 'after', 'autoload', 'plugin', 'colors', 'ftdetect', 'compiler' },
    css = 'css',
    scss = 'scss',
    java = { 'src', 'test' },
  },
  prompt = false,
})
