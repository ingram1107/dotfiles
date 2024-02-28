-- slime conf
vim.g.slime_target = 'neovim'
vim.g.slime_no_mappings = 1

-- TODO:
--    maybe there is a way to get relative win id
--      - littleclover  Fri 12 Mar 2021 08:55:07 PM +08
-- vim.g.slime_default_config = {
--   socket_name = 'default',
--   target_pane = ':.0',
-- }
-- vim.g.slime_dont_ask_default = 1

-- aedile conf
require('aedile').setup({
  repl = {
    lua = 'luajit',
    lisp = 'sbcl',
    python = 'python',
  },
  split_method = 'vertical',
  scrollup_map = '<M-u>',
  scrolldown_map = '<M-d>',
})
