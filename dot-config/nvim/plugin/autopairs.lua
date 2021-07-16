-- autopairs
local nv_pairs = require('nvim-autopairs')
local rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

nv_pairs.setup { }

require('nvim-autopairs.completion.compe').setup {
  map_cr       = true,
  map_complete = true,
}

nv_pairs.add_rules({
  rule('$', '$', 'vimwiki')
    :with_pair(cond.not_after_text_check('$'))
    :with_pair(cond.not_before_regex_check('%w'))
    :with_move(cond.after_text_check('$'))
    :with_cr(cond.none())
})
