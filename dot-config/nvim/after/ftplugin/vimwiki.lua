-- Vimwiki external filetype plugin
-- add readability
vim.wo.linebreak = true
vim.wo.wrap = true
vim.wo.foldlevel = 1

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
