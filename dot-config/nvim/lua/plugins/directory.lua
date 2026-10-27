return {
  {
    'elihunter173/dirbuf.nvim',
    keys = {
      {
        '<c-n>',
        '<cmd>Dirbuf<cr>'
      },
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = 'NvimTreeToggle',
    config = function()
      require('nvim-tree').setup({
        hijack_cursor = true,
        hijack_directories = {
          enable = false,
        },
        renderer = {
          highlight_git = true,
          highlight_opened_files = 'all',
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
        },
        view = {
          width = 25,
        },
        filters = {
          custom = { '.git', 'node_modules' },
        },
      })
    end,
  },
}
