return {
  {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'romgrk/nvim-treesitter-context',
    },
    lazy = 'false',
    run = ':TSUpdate',
    branch = 'main',
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
  },
  {
    'romgrk/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup({
        max_lines = 3,
      })
    end,
  },
}
