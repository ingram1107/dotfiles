-- cmp+lspkind
local cmp = require('cmp')
local types = require('cmp.types')
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ['<c-d>'] = cmp.mapping.scroll_docs(-4),
    ['<c-f>'] = cmp.mapping.scroll_docs(4),
    ['<c-l>'] = cmp.mapping.complete(),
    ['<c-e>'] = cmp.mapping.close(),
    ['<cr>'] = cmp.mapping.confirm({ select = true, cmp.ConfirmBehavior.Insert }),
  }),

  sources = cmp.config.sources({
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'conjure' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'buffer', keyword_length = 5 },
  }),

  formatting = {
    format = lspkind.cmp_format({
      with_text = false,
      maxwidth = 50,
    }),
  },

  experimental = {
    native_menu = false,
    ghost_text = true,
  },
})
