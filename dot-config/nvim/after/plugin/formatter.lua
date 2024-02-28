-- formatter.nvim conf

require('formatter').setup({
  logging = true,
  filetype = {
    c = {
      function()
        return {
          exe = 'astyle',
          args = {
            '--style=kr',
            '--indent=spaces=2',
            '--break-blocks',
            '--pad-oper --pad-comma --pad-header',
            '--align-pointer=name',
            '--break-one-line-headers',
            '--add-braces',
            '--convert-tabs',
            '--max-code-length=80',
          },
          stdin = true,
        }
      end,
    },
    rust = {
      function()
        return {
          exe = 'rustfmt',
          args = { '--emit=stdout' },
          stdin = true,
        }
      end,
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
      end,
    },
  },
})
