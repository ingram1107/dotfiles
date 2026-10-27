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
  {
    'ThePrimeagen/harpoon',
    keys = {
      {
        '<leader>ma',
        function()
          require('harpoon.mark').add_file()
        end,
        desc = 'place a Harpoon mark',
      },
      {
        '<leader>m1',
        function()
          require('harpoon.ui').nav_file(1)
        end,
        desc = 'navigate to Harpoon mark 1',
      },
      {
        '<leader>m2',
        function()
          require('harpoon.ui').nav_file(2)
        end,
        desc = 'navigate to Harpoon mark 2',
      },
      {
        '<leader>m3',
        function()
          require('harpoon.ui').nav_file(3)
        end,
        desc = 'navigate to Harpoon mark 3',
      },
      {
        '<leader>m4',
        function()
          require('harpoon.ui').nav_file(4)
        end,
        desc = 'navigate to Harpoon mark 4',
      },
      {
        '<leader>m5',
        function()
          require('harpoon.ui').nav_file(5)
        end,
        desc = 'navigate to Harpoon mark 5',
      },
      {
        '<leader>m6',
        function()
          require('harpoon.ui').nav_file(6)
        end,
        desc = 'navigate to Harpoon mark 6',
      },
      {
        '<leader>m7',
        function()
          require('harpoon.ui').nav_file(7)
        end,
        desc = 'navigate to Harpoon mark 7',
      },
      {
        '<leader>m8',
        function()
          require('harpoon.ui').nav_file(8)
        end,
        desc = 'navigate to Harpoon mark 8',
      },
      {
        '<leader>m9',
        function()
          require('harpoon.ui').nav_file(9)
        end,
        desc = 'navigate to Harpoon mark 9',
      },
      {
        '<leader>m0',
        function()
          require('harpoon.ui').nav_file(10)
        end,
        desc = 'navigate to Harpoon mark 10',
      },
      {
        '<leader>mm',
        function()
          require('harpoon.ui').toggle_quick_menu()
        end,
        desc = 'open Harpoon menu',
      },
    },
  },
}
