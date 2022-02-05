-- dirvish ft conf
vim.api.nvim_buf_set_keymap(0, 'n', '-', '<Plug>(dirvish_up)', { silent = true })

--- custom delete DorvishDelete
vim.cmd([[
function! g:DovishDelete(target) abort
  return 'rm -rf ' . shellescape(a:target)
endfunction
]])
