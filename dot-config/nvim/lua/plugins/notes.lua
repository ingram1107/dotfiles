return {
  'ledger/vim-ledger',
  {
    'zk-org/zk-nvim',
    keys = {
      { '<leader>zn', '<cmd>ZkNew { title = vim.fn.input("Title: ") }<cr>' },
      { '<leader>zo', '<cmd>ZkNotes { sort = { "modified" } }<cr>' },
      { '<leader>zt', '<cmd>ZkTags<cr>' },
      { '<leader>zf', '<cmd>ZkNotes { sort = { "modified" }, match = { vim.fn.input("Search: ") } }<cr>' },
      { '<leader>zf', ":'<,'>ZkMatch<cr>", mode = 'v' },
    },
  },
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
