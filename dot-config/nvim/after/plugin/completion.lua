-- cmp conf
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  mapping = {
    ['<c-d>'] = cmp.mapping.scroll_docs(-4),
    ['<c-f>'] = cmp.mapping.scroll_docs(4),
    ['<c-l>'] = cmp.mapping.complete(),
    ['<c-e>'] = cmp.mapping.close(),
    ['<c-y>'] = cmp.mapping.confirm({ select = true }),
  },

  sources = cmp.config.sources({
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'luasnip' },
    { name = 'buffer', keyword_length = 5 },
  }),

  experimental = {
    native_menu = false,
    ghost_text = true,
  }
})

-- autopairs conf
local nv_pairs = require('nvim-autopairs')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

nv_pairs.setup { 
  disable_filetype = { "TelescopePrompt" , "lisp" },
}

cmp.event:on('confirm_done',cmp_autopairs.on_confirm_done({ map_char = { tex = '' }}))
cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"

nv_pairs.add_rules({
  rule('$', '$', 'vimwiki')
    :with_pair(cond.not_after_text_check('$'))
    :with_pair(cond.not_before_regex_check('%w'))
    :with_move(cond.after_text_check('$'))
    :with_cr(cond.none())
})
