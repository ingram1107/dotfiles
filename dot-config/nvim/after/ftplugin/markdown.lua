-- Markdown external filetype plugin
-- add readability
vim.wo.linebreak = true
vim.wo.wrap = true
vim.bo.textwidth = 80

-- activate zk.nvim
require('zk').setup({ picker = 'telescope' })

-- magma mapping
vim.keymap.set('n', '<leader>r', ':MagmaEvaluateOperator<cr>', { buffer = true, silent = true, expr = true })
vim.keymap.set('n', '<leader>rr', ':MagmaEvaluateLine<cr>', { buffer = true, silent = true })
vim.keymap.set('x', '<leader>r', ':<C-u>MagmaEvaluateVisual<cr>', { buffer = true, silent = true })
vim.keymap.set('n', '<leader>rc', ':MagmaReevaluateCell<cr>', { buffer = true, silent = true })
vim.keymap.set('n', '<leader>rd', ':MagmaDelete<cr>', { buffer = true, silent = true })
vim.keymap.set('n', '<leader>ro', ':MagmaShowOutput<cr>', { buffer = true, silent = true })

vim.g.magma_automatically_open_output = false

-- zk mapping
require('zk.commands').add('ZkOrphans', function(options)
  options = vim.tbl_extend('force', { orphan = true }, options or {})
  require('zk').edit(options, { title = 'Zk Orphans', sort = 'modified' })
end)

vim.keymap.set('n', '<leader>zz', '<cmd>ZkSetup<cr>', { buffer = true, silent = true })
if require('zk.util').notebook_root(vim.fn.expand('%:p')) ~= nil then
  vim.keymap.set('n', '<cr>', '<cmd>lua vim.lsp.buf.definition()<cr>', { buffer = true, silent = true })
  vim.keymap.set('n', '<leader>zb', '<cmd>ZkBacklinks<cr>', { buffer = true, silent = true })
  vim.keymap.set(
    'v',
    '<leader>znt',
    ":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>",
    { buffer = true, silent = true }
  )
  vim.keymap.set(
    'v',
    '<leader>znc',
    ":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>",
    { buffer = true, silent = true }
  )
  vim.keymap.set('n', '<leader>zl', '<cmd>ZkLinks<cr>', { buffer = true, silent = true })
  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', { buffer = true, silent = true })
  vim.keymap.set('n', '<leader>zp', '<cmd>ZkOrphans<cr>', { buffer = true, silent = true })
  vim.keymap.set('n', '<leader>zi', '<cmd>ZkInsertLink<cr>', { buffer = true,  silent = true })
end

-- markdownpreview mapping
vim.keymap.set('n', 'm<cr>', ':MarkdownPreview<cr>', { buffer = true, silent = true })
vim.keymap.set('n', 'm<space>', ':MarkdownPreview ', { buffer = true })
