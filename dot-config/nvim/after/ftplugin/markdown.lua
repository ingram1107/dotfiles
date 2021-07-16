-- Markdown external filetype plugin
-- add readability
vim.wo.linebreak = true
vim.wo.wrap = true
vim.bo.textwidth = 80

require('compe').setup({
  enabled = true,
  autocomplete = false,
  source = {
    path = true,
    buffer = true,
    spell = true,
    ultisnips = true,
  },
}, 0)
