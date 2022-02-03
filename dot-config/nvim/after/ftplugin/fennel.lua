-- slime keymaps
vim.api.nvim_buf_set_keymap(0, 'n', '<c-c><c-c>', ':<c-u>call slime#store_curpos()<cr>:set opfunc=slime#send_op<cr>g@aF', { silent = true })

-- vim-sexp keymaps
--- surround
vim.api.nvim_buf_set_keymap(0, 'n', 'dsf', '<Plug>(sexp_splice_list)', {})

--- > mapping
vim.api.nvim_buf_set_keymap(0, 'n', '<I', '<Plug>(sexp_insert_at_list_head)', {})
vim.api.nvim_buf_set_keymap(0, 'n', '>I', '<Plug>(sexp_insert_at_list_tail)', {})
vim.api.nvim_buf_set_keymap(0, 'n', '<f', '<Plug>(sexp_swap_list_backward)', {})
vim.api.nvim_buf_set_keymap(0, 'n', '>f', '<Plug>(sexp_swap_list_forward)', {})
vim.api.nvim_buf_set_keymap(0, 'n', '<e', '<Plug>(sexp_swap_element_backward)', {})
vim.api.nvim_buf_set_keymap(0, 'n', '>e', '<Plug>(sexp_swap_element_forward)', {})
vim.api.nvim_buf_set_keymap(0, 'n', '>(', '<Plug>(sexp_emit_head_element)', {})
vim.api.nvim_buf_set_keymap(0, 'n', '<)', '<Plug>(sexp_emit_tail_element)', {})
vim.api.nvim_buf_set_keymap(0, 'n', '<(', '<Plug>(sexp_capture_prev_element)', {})
vim.api.nvim_buf_set_keymap(0, 'n', '>)', '<Plug>(sexp_capture_next_element)', {})

-- paren mapping
vim.api.nvim_buf_set_keymap(0, 'n', '[(', '<Plug>(sexp_flow_to_prev_open)', {})
vim.api.nvim_buf_set_keymap(0, 'n', '](', '<Plug>(sexp_flow_to_next_open)', {})
vim.api.nvim_buf_set_keymap(0, 'n', '[)', '<Plug>(sexp_flow_to_prev_close)', {})
vim.api.nvim_buf_set_keymap(0, 'n', '])', '<Plug>(sexp_flow_to_next_close)', {})
