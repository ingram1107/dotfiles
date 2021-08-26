-- formatter.nvim conf

require('formatter').setup {
  logging = true,
  filetype = {
    rust = {
      function()
        return {
          exe = 'rustfmt',
          args = {'--emit=stdout'},
          stdin = true,
        }
      end
    },
    lua = {
      function()
        return {
          exe = 'stylua',
          args = {
            '--config-path',
            '~/.config/stylua.toml',
            '-',
          },
          stdin = true,
        }
      end
    },
  }
}
