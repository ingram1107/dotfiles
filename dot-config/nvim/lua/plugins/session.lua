return {
  {
    'ingram1107/souvenir.nvim',
    config = function()
      -- souvenir conf

      require('souvenir').setup({
        override = true,
      })
    end,
  },
  'ThePrimeagen/harpoon',
}
