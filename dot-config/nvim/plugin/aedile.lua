-- aedile conf

require('aedile').setup {
  repl = {
    lua = 'luajit',
    lisp = 'sbcl',
    python = 'python',
  },
  split_method = 'vertical',
  scrollup_map = '<M-u>',
  scrolldown_map = '<M-d>',
}
