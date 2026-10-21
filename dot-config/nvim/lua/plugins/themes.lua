return {
  'ingram1107/vim-zhi',
  {
    'Th3Whit3Wolf/space-nvim',
    lazy = false,
    priority = 1000,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      vim.cmd([[ colorscheme space-nvim ]])
      vim.g.space_nvim_transparent_by = false
    end,
  },
}
