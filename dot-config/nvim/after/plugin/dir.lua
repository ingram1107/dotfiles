-- nvim-tree conf
require('nvim-tree').setup({
  renderer = {
    highlight_git = true,
    highlight_opened_files = 'all'
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
})
