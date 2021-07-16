-- dirvish conf
vim.g.dirvish_mode = ':sort ,^\\v(.*[\\/])|\\ze,'
vim.g.dirvish_relative_paths = 1

-- override netrw
vim.g.netrwPlugin = 1
vim.api.nvim_exec([[
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore topleft split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
]], false)
