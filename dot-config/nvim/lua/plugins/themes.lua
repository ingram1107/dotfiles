return {
  'ingram1107/vim-zhi',
  {
    'serhez/teide.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd([[ colorscheme teide-dark ]])
    end,
  },
}
