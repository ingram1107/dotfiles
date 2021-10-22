-- Vimwiki external filetype plugin
-- add readability
vim.wo.linebreak = true
vim.wo.wrap = true
vim.wo.foldlevel = 1

-- search keymaps
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>wv', '<cmd>VimwikiSearch /\\v\\[\\ \\]/<cr>', {})
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>wo', '<cmd>VimwikiSearch /\\v\\[\\cX\\]/<cr>', {})
vim.api.nvim_buf_set_keymap(0, 'n', '<tab>', '<cmd>VimwikiNextLink<cr>zv', { silent = true, noremap = true})
vim.api.nvim_buf_set_keymap(0, 'n', '<s-tab>', '<cmd>VimwikiPrevLink<cr>zv', { silent = true, noremap = true})

require('compe').setup({
  enabled = true,
  autocomplete = false,
  source = {
    path = true,
    buffer = true,
    spell = true,
    ultisnips = true,
  },
})
