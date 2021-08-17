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
    }
  }
}
