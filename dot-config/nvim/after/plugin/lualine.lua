-- lualine conf
require('lualine').setup({
  options = {
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    globalstatus = true,
    theme = 'space-nvim',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { 'diff', 'filename' },
    lualine_x = { 'filetype' },
    lualine_y = { 'diagnostics' },
    lualine_z = { 'progress', 'location' },
  },
})
