-- luasnip
local ls = require('luasnip')
local sniploader_lua = require('luasnip.loaders.from_lua')

ls.config.set_config({
  enable_autosnippets = true,
})

sniploader_lua.load({ include = { 'lua', 'all' } })
sniploader_lua.lazy_load({ include = { 'bib', 'c', 'cpp', 'markdown', 'tex', 'xml' } })
