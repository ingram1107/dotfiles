-- aedile conf
local async
async = vim.loop.new_async(function()
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
  async:close()
end)
async:send()
