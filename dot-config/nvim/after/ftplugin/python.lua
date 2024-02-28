-- python ft conf
vim.cmd('compiler python')
vim.bo.textwidth = 79

-- magma mapping
vim.keymap.set('n', '<leader>r', ':MagmaEvaluateOperator<cr>', { buffer = true, silent = true, expr = true })
vim.keymap.set('n', '<leader>rr', ':MagmaEvaluateLine<cr>', { buffer = true, silent = true })
vim.keymap.set('x', '<leader>r', ':<C-u>MagmaEvaluateVisual<cr>', { buffer = true, silent = true })
vim.keymap.set('n', '<leader>rc', ':MagmaReevaluateCell<cr>', { buffer = true, silent = true })
vim.keymap.set('n', '<leader>rd', ':MagmaDelete<cr>', { buffer = true, silent = true })
vim.keymap.set('n', '<leader>ro', ':MagmaShowOutput<cr>', { buffer = true, silent = true })

vim.g.magma_automatically_open_output = false
