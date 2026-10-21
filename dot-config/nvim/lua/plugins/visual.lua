return {
  {
    'luukvbaal/stabilize.nvim',
    config = function()
      require('stabilize').setup()
    end,
  },
  {
    'https://gitlab.com/yorickpeterse/nvim-pqf',
    config = function()
      require('pqf').setup()
    end,
  },
  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function()
      require('lsp_lines').setup()

      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  },
}
