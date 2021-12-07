-- Markdown external filetype plugin
-- add readability
vim.wo.linebreak = true
vim.wo.wrap = true
vim.bo.textwidth = 80

-- magma mapping
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>r', ':MagmaEvaluateOperator<cr>', { silent = true, expr = true, noremap = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>rr', ':MagmaEvaluateLine<cr>', { silent = true, noremap = true })
vim.api.nvim_buf_set_keymap(0, 'x', '<leader>r', ':<C-u>MagmaEvaluateVisual<cr>', { silent = true, noremap = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>rc', ':MagmaReevaluateCell<cr>', { silent = true, noremap = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>rd', ':MagmaDelete<cr>', { silent = true, noremap = true })
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ro', ':MagmaShowOutput<cr>', { silent = true, noremap = true })

vim.g.magma_automatically_open_output = false
