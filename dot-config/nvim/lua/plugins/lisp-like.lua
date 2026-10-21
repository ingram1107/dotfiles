return {
  'guns/vim-sexp',
  {
    'Olical/conjure',
    dependencies = 'Olical/aniseed',
    config = function()
      vim.g['conjure#mapping#prefix'] = '\\'
      vim.g['conjure#filetype#fennel'] = 'conjure.client.fennel.stdio'
      -- Issue#628: To prevent overwritting 'K' mapping
      vim.g['conjure#mapping#doc_word'] = false
    end,
  },
  { 'eraserhd/parinfer-rust', cmd = 'ParinferOn', build = 'cargo build --release' },
}
