return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      -- telescope conf
      local t = require('telescope')

      t.setup({
        defaults = {
          sorting_strategy = 'ascending',
          layout_config = {
            horizontal = {
              width = 0.95,
              height = 0.85,
              preview_width = 0.6,
            },
            vertical = {
              width = 0.5,
              height = 0.5,
            },
          },
          color_devicons = true,
        },
      })

      t.load_extension('fzf')
      t.load_extension('souvenir')
      t.load_extension('harpoon')
    end,
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install',
    dependencies = 'nvim-telescope/telescope.nvim',
  },
  'jremmen/vim-ripgrep',
}
