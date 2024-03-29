--- comment.nvim config
-- extended mapping
local api = require('Comment.api')

vim.keymap.set('n', 'g>', api.call('comment.linewise', 'g@'), { expr = true, desc = 'Comment region linewise' })
vim.keymap.set('n', 'g>c', api.call('comment.linewise.current', 'g@$'), { expr = true, desc = 'Comment current line' })
vim.keymap.set(
  'n',
  'g>b',
  api.call('comment.blockwise.current', 'g@$'),
  { expr = true, desc = 'Comment current block' }
)

vim.keymap.set('n', 'g<', api.call('uncomment.linewise', 'g@'), { expr = true, desc = 'Uncomment region linewise' })
vim.keymap.set(
  'n',
  'g<c',
  api.call('uncomment.linewise.current', 'g@$'),
  { expr = true, desc = 'Uncomment current line' }
)
vim.keymap.set(
  'n',
  'g<b',
  api.call('uncomment.blockwise.current', 'g@$'),
  { expr = true, desc = 'Uncomment current block' }
)

local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)

vim.keymap.set('x', 'g>', function()
  vim.api.nvim_feedkeys(esc, 'nx', false)
  api.locked('comment.linewise')(vim.fn.visualmode())
end, { desc = 'Comment region linewise (visual)' })

vim.keymap.set('x', 'g<', function()
  vim.api.nvim_feedkeys(esc, 'nx', false)
  api.locked('uncomment.linewise')(vim.fn.visualmode())
end, { desc = 'Uncomment region linewise (visual)' })
