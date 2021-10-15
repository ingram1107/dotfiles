-- dirvish conf
vim.g.dirvish_mode = ':sort ,^\\v(.*[\\/])|\\ze,'
vim.g.dirvish_relative_paths = 1

-- override netrw
vim.g.loaded_netrwPlugin = 1
vim.api.nvim_exec([[
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore topleft split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
]], false)

-- nvim-tree conf
vim.g.nvim_tree_ignore = { '.git', 'node_modules' }
vim.g.nvim_tree_highlight_opened_files = 2
vim.g.nvim_tree_git_hl = true
vim.g.nvim_tree_quit_on_open = 1
