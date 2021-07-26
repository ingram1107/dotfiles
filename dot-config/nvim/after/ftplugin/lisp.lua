-- lisp ft conf
vim.bo.commentstring = ";;%s"

-- slime keymaps
vim.api.nvim_buf_set_keymap(0, 'n', '<c-c><c-c>', ':<c-u>call slime#store_curpos()<cr>:set opfunc=slime#send_op<cr>g@aF', { silent = true })

-- vim-sexp keymaps
--- disable insert mode mappigns
vim.g.sexp_enable_insert_mode_mappings = 0

--- surround
vim.api.nvim_buf_set_keymap(0, 'n', 'dsf', '<Plug>(sexp_splice_list)', {})

--- word mapping
vim.api.nvim_buf_set_keymap(0, 'n', 'b', '<Plug>(sexp_flow_to_prev_leaf_head)', {})
vim.api.nvim_buf_set_keymap(0, 'n', 'w', '<Plug>(sexp_flow_to_next_leaf_head)', {})
vim.api.nvim_buf_set_keymap(0, 'n', 'ge', '<Plug>(sexp_flow_to_prev_leaf_tail)', {})
vim.api.nvim_buf_set_keymap(0, 'n', 'e', '<Plug>(sexp_flow_to_next_leaf_tail)', {})
vim.api.nvim_buf_set_keymap(0, 'x', 'b', '<Plug>(sexp_flow_to_prev_leaf_head)', {})
vim.api.nvim_buf_set_keymap(0, 'x', 'w', '<Plug>(sexp_flow_to_next_leaf_head)', {})
vim.api.nvim_buf_set_keymap(0, 'x', 'ge', '<Plug>(sexp_flow_to_prev_leaf_tail)', {})
vim.api.nvim_buf_set_keymap(0, 'x', 'e', '<Plug>(sexp_flow_to_next_leaf_tail)', {})
vim.api.nvim_buf_set_keymap(0, 'o', 'b', '<Plug>(sexp_flow_to_prev_leaf_head)', {})
vim.api.nvim_buf_set_keymap(0, 'o', 'w', '<Plug>(sexp_flow_to_next_leaf_head)', {})
vim.api.nvim_buf_set_keymap(0, 'o', 'ge', '<Plug>(sexp_flow_to_prev_leaf_tail)', {})
vim.api.nvim_buf_set_keymap(0, 'o', 'e', '<Plug>(sexp_flow_to_next_leaf_tail)', {})
vim.api.nvim_buf_set_keymap(0, 'n', 'B', '<Plug>(sexp_move_to_prev_element_head)', {})
vim.api.nvim_buf_set_keymap(0, 'n', 'W', '<Plug>(sexp_move_to_next_element_head)', {})
vim.api.nvim_buf_set_keymap(0, 'n', 'gE', '<Plug>(sexp_move_to_prev_element_tail)', {})
vim.api.nvim_buf_set_keymap(0, 'n', 'E', '<Plug>(sexp_move_to_next_element_tail)', {})
vim.api.nvim_buf_set_keymap(0, 'x', 'B', '<Plug>(sexp_move_to_prev_element_head)', {})
vim.api.nvim_buf_set_keymap(0, 'x', 'W', '<Plug>(sexp_move_to_next_element_head)', {})
vim.api.nvim_buf_set_keymap(0, 'x', 'gE', '<Plug>(sexp_move_to_prev_element_tail)', {})
vim.api.nvim_buf_set_keymap(0, 'x', 'E', '<Plug>(sexp_move_to_next_element_tail)', {})
vim.api.nvim_buf_set_keymap(0, 'o', 'B', '<Plug>(sexp_move_to_prev_element_head)', {})
vim.api.nvim_buf_set_keymap(0, 'o', 'W', '<Plug>(sexp_move_to_next_element_head)', {})
vim.api.nvim_buf_set_keymap(0, 'o', 'gE', '<Plug>(sexp_move_to_prev_element_tail)', {})
vim.api.nvim_buf_set_keymap(0, 'o', 'E', '<Plug>(sexp_move_to_next_element_tail)', {})

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
