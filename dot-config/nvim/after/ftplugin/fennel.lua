-- Fennel filetype plugin
vim.cmd([[
imap <silent><buffer> (    <Plug>(sexp_insert_opening_round)
imap <silent><buffer> [    <Plug>(sexp_insert_opening_square)
imap <silent><buffer> {    <Plug>(sexp_insert_opening_curly)
imap <silent><buffer> )    <Plug>(sexp_insert_closing_round)
imap <silent><buffer> ]    <Plug>(sexp_insert_closing_square)
imap <silent><buffer> }    <Plug>(sexp_insert_closing_curly)
imap <silent><buffer> "    <Plug>(sexp_insert_double_quote)
imap <silent><buffer> <BS> <Plug>(sexp_insert_backspace)
]])
