return {
  'ledger/vim-ledger',
  'zk-org/zk-nvim',
  {
    'OXY2DEV/markview.nvim',
    lazy = false,
  },
  {
    '3rd/image.nvim',
    build = false,
    opts = {
      processor = 'magick_cli',
    },
  },
  'davidgranstrom/nvim-markdown-preview',
}
