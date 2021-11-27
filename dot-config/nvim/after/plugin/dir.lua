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
vim.g.nvim_tree_highlight_opened_files = 2
vim.g.nvim_tree_git_hl = true

require('nvim-tree').setup {
  disable_netrw = false,
  hijack_netrw = false,
  auto_close = true,
  hijack_cursor = true,

  diagnostic = {
    enable = true,
  },

  update_to_buf_dir = {
    enable = false,
  },

  view = {
    width = 25,
  },

  filters = {
    custom = { '.git', 'node_modules' },
  },
}
