return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'saadparwaiz1/cmp_luasnip',
      'PaterJason/cmp-conjure',
    },
  },
  'onsails/lspkind-nvim',
  'windwp/nvim-ts-autotag',
  
  -- snippet support
  {
    'L3MON4D3/LuaSnip',
    tag = 'v2.2.0',
    build = 'make install_jsregexp',
    config = function()
      require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/luasnippets/' })
    end,
  },
}
