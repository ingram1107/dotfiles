return {
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },

  {
    'tpope/vim-eunuch',
    cmd = {
      'Delete',
      'Unlink',
      'Remove',
      'Rename',
      'Chmod',
      'Mkdir',
      'SudoEdit',
      'SudoWrite',
    },
  },
}
