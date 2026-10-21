return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup({
        options = {
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          globalstatus = true,
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
    end,
  },
  {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup({
        notification = {
          window = {
            winblend = 50,
          },
        },
      })
    end,
  },
}
