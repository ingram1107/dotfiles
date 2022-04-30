-- helpers {{{1
local nmap = function(tbl)
  vim.keymap.set('n', tbl[1], tbl[2], tbl[3])
end

local imap = function(tbl)
  vim.keymap.set('i', tbl[1], tbl[2], tbl[3])
end

local vmap = function(tbl)
  vim.keymap.set('v', tbl[1], tbl[2], tbl[3])
end

local cmap = function(tbl)
  vim.keymap.set('c', tbl[1], tbl[2], tbl[3])
end

local tmap = function(tbl)
  vim.keymap.set('t', tbl[1], tbl[2], tbl[3])
end

local xmap = function(tbl)
  vim.keymap.set('x', tbl[1], tbl[2], tbl[3])
end

local smap = function(tbl)
  vim.keymap.set('s', tbl[1], tbl[2], tbl[3])
end

-- mapleader {{{1
nmap({ ' ', '<nop>' })
vim.g.mapleader = ' '

-- :source file {{{1
nmap({ '<leader>ss', '<cmd>source<cr>', { silent = true } })
nmap({ '<leader>sk', '<cmd>source $XDG_CONFIG_HOME/nvim/lua/keymaps.lua<cr>', { silent = true } })

-- spelling {{{1
nmap({ '<leader>c', '<cmd>setlocal spell! spelllang=en_gb<cr>', { silent = true } })
imap({ '<c-c>', '<c-g>u<esc>[s1z=`]a<c-g>u' })

-- show highlight group {{{1
nmap({ '<f10>', '<cmd>TSHighlightCapturesUnderCursor<cr>' })

-- quickhelp {{{1
nmap({ '<leader>hh', ':h <c-r><c-w><cr>' })

-- terminal esc {{{1
tmap({ '<esc>', '<c-\\><c-n>' })

-- termdebug {{{1
nmap({ '<leader>dt', ':Termdebug ' })
nmap({ '<leader>dd', '<cmd>Gdb<cr>', { silent = true } })
nmap({ '<leader>dp', '<cmd>Program<cr>', { silent = true } })
nmap({ '<leader>ds', '<cmd>Source<cr>', { silent = true } })
nmap({ '<leader>da', '<cmd>Asm<cr>', { silent = true } })
nmap({ '<leader>dK', '<cmd>Evaluate<cr>', { silent = true } })
nmap({ '<leader>dr', '<cmd>Run<cr>', { silent = true } })
nmap({ '<leader>dA', ':Arguments ' })
nmap({ '<leader>dB', '<cmd>Break<cr>', { silent = true } })
nmap({ '<leader>dC', '<cmd>Clear<cr>', { silent = true } })
nmap({ '<leader>dj', '<cmd>Step<cr>', { silent = true } })
nmap({ '<leader>dO', '<cmd>Over<cr>', { silent = true } })
nmap({ '<leader>dD', '<cmd>Finish<cr>', { silent = true } })
nmap({ '<leader>dc', '<cmd>Continue<cr>', { silent = true } })
nmap({ '<leader>dT', '<cmd>Stop<cr>', { silent = true } })

-- add new lines {{{1
nmap({ '[<space>', 'm`O<esc>``' })
nmap({ ']<space>', 'm`o<esc>``' })

-- move line {{{1
nmap({ '[e', '<cmd>move .-2<cr>', { silent = true } })
nmap({ ']e', '<cmd>move .+1<cr>', { silent = true } })

vmap({ '[e', '<-2<cr>gv=gv"', { silent = true } }) --- <cmd> does not do the job wel
vmap({ ']e', '>+1<cr>gv=gv"', { silent = true } }) --- <cmd> does not do the job wel

-- window resize {{{1
nmap({ '<m-h>', '<c-w><' })
nmap({ '<m-l>', '<c-w>>' })
nmap({ '<m-k>', '<c-w>+' })
nmap({ '<m-j>', '<c-w>-' })

-- quickfix and local list navigation {{{1
nmap({ '[C', '<cmd>copen<cr>' })
nmap({ ']C', '<cmd>cclose<cr>' })
nmap({ '[L', '<cmd>lopen<cr>' })
nmap({ ']L', '<cmd>lclose<cr>' })
nmap({ '[c', '<cmd>cprevious<cr>' })
nmap({ ']c', '<cmd>cnext<cr>' })
nmap({ '[l', '<cmd>lprevious<cr>' })
nmap({ ']l', '<cmd>lnext<cr>' })

-- directory viewer and drawer {{{1
nmap({ '<c-n>', '<cmd>Dirbuf<cr>' })
nmap({ '<c-p>', '<cmd>NvimTreeToggle<cr>' })

-- snippet {{{1
local function prequire(...)
  local status, lib = pcall(require, ...)
  if status then
    return lib
  end

  return nil
end

local luasnip = prequire('luasnip')
local cmp = prequire('cmp')

local tc = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

_G.luasnip_expand_or_jump = function()
  if cmp and cmp.visible() then
    cmp.select_next_item()
  elseif luasnip and luasnip.expand_or_jumpable() then
    return tc('<Plug>luasnip-expand-or-jump')
  elseif check_back_space() then
    return tc('<c-k>')
  else
    cmp.complete()
  end
  return ''
end

_G.luasnip_jump_to_previous = function()
  if cmp and cmp.visible() then
    cmp.select_prev_item()
  elseif luasnip and luasnip.jumpable(-1) then
    return tc('<Plug>luasnip-jump-prev')
  else
    return tc('<c-j>')
  end
  return ''
end

nmap({ '<leader>ls', '<cmd>lua require("luasnip.loaders.from_lua").edit_snippet_files()<cr>' })
imap({ '<c-k>', 'v:lua.luasnip_expand_or_jump()', { expr = true } })
imap({ '<c-j>', 'v:lua.luasnip_jump_to_previous()', { expr = true } })
imap({ '<c-h>', '<Plug>luasnip-next-choice' })
smap({ '<c-k>', 'v:lua.luasnip_expand_or_jump()', { expr = true } })
smap({ '<c-j>', 'v:lua.luasnip_jump_to_previous()', { expr = true } })
smap({ '<c-h>', '<Plug>luasnip-next-choice' })

-- undotree {{{1
nmap({ '<leader>u', '<cmd>UndotreeToggle<cr>' })

-- treesitter {{{1
nmap({
  '<leader>tt',
  function()
    require('nvim-treesitter-playground.internal').toggle()
  end,
  { desc = 'toggle treesitter playground' },
})
nmap({
  '<leader>tr',
  function()
    vim.cmd('write|edit')
  end,
  { desc = 'restart nvim-treesitter', silent = true },
})

-- add tags (C/C++) {{{1
nmap({ '[t', '<cmd>call jobstart("ctags -R")<cr>' })

-- aedile {{{1
nmap({
  '<leader>rr',
  function()
    require('aedile').toggle_repl()
  end,
  { desc = 'toggle Aedile REPL' },
})
nmap({
  '<leader>rc',
  function()
    require('aedile').terminate_repl()
  end,
  { desc = 'terminate Aedile REPL' },
})

-- slime {{{1
nmap({ '<c-c><c-c>', ':<c-u>call slime#store_curpos()<cr>:set opfunc=slime#send_op<cr>g@af', { silent = true } })
nmap({ '<c-c>v', '<Plug>SlimeConfig' })
xmap({ '<c-c><c-c>', '<Plug>SlimeRegionSend' })

-- projectionist {{{1
nmap({ '<leader>pa', '<cmd>A<cr>' })
nmap({ '<leader>ps', ':AS ' })
nmap({ '<leader>pv', ':AV ' })
nmap({ '<leader>pt', ':AT ' })
nmap({ '<leader>po', ':AO ' })
nmap({ '<leader>pd', '<cmd>AD<cr>' })

-- telescope {{{1
nmap({
  '<leader>ff',
  function()
    require('telescope-custom').rg()
  end,
  { desc = 'fuzzy find files in current working directory' },
})
nmap({
  '<leader>fd',
  function()
    require('telescope-custom').rg_dot()
  end,
  { desc = 'fuzzy find files in $XDG_CONFIG_HOME' },
})
nmap({
  '<leader>fn',
  function()
    require('telescope-custom').rg_note()
  end,
  { desc = 'fuzzy find files in Neorg workspace' },
})
nmap({
  '<leader>fg',
  function()
    require('telescope-custom').git_branches()
  end,
  { desc = 'fuzzy find git branches' },
})
nmap({
  '<leader>fr',
  function()
    require('telescope-custom').live_grep()
  end,
  { desc = 'fuzzy find lines in current working directory' },
})
nmap({
  '<leader>fb',
  function()
    require('telescope-custom').buffers()
  end,
  { desc = 'fuzzy find buffers' },
})
nmap({
  '<leader>fl',
  function()
    require('telescope-custom').current_buffer_fuzzy_find()
  end,
  { desc = 'fuzzy find lines in current buffer' },
})
nmap({
  '<leader>fh',
  function()
    require('telescope.builtin').help_tags()
  end,
  { desc = 'fuzzy find help tags' },
})
nmap({
  '<leader>fq',
  function()
    require('telescope.builtin').quickfix()
  end,
  { desc = 'fuzzy find quickfix list' },
})
nmap({
  '<leader>ft',
  function()
    require('telescope.builtin').tags()
  end,
  { desc = 'fuzzy find ctags' },
})
nmap({
  '<leader>fw',
  function()
    require('telescope.builtin').lsp_workspace_symbols()
  end,
  { desc = 'fuzzy find LSP workspace symbols' },
})
nmap({
  '<leader>fm',
  function()
    require('telescope.builtin').keymaps()
  end,
  { desc = 'fuzzy find keymaps' },
})
nmap({
  '<leader>fs',
  function()
    require('telescope').extensions.souvenir.souvenir()
  end,
  { desc = 'fuzzy find saved sessions' },
})
cmap({
  '<c-r><c-r>',
  function()
    require('telescope.builtin').commands()
  end,
  { desc = 'fuzzy find commands' },
  { nowait = true },
})

-- harpoon {{{1
nmap({
  '<leader>ma',
  function()
    require('harpoon.mark').add_file()
  end,
  { desc = 'place a Harpoon mark' },
})
nmap({
  '<leader>m1',
  function()
    require('harpoon.ui').nav_file(1)
  end,
  { desc = 'navigate to Harpoon mark 1' },
  nmap,
})
nmap({
  '<leader>m2',
  function()
    require('harpoon.ui').nav_file(2)
  end,
  { desc = 'navigate to Harpoon mark 2' },
})
nmap({
  '<leader>m3',
  function()
    require('harpoon.ui').nav_file(3)
  end,
  { desc = 'navigate to Harpoon mark 3' },
})
nmap({
  '<leader>m4',
  function()
    require('harpoon.ui').nav_file(4)
  end,
  { desc = 'navigate to Harpoon mark 4' },
})
nmap({
  '<leader>m5',
  function()
    require('harpoon.ui').nav_file(5)
  end,
  { desc = 'navigate to Harpoon mark 5' },
})
nmap({
  '<leader>m6',
  function()
    require('harpoon.ui').nav_file(6)
  end,
  { desc = 'navigate to Harpoon mark 6' },
})
nmap({
  '<leader>m7',
  function()
    require('harpoon.ui').nav_file(7)
  end,
  { desc = 'navigate to Harpoon mark 7' },
})
nmap({
  '<leader>m8',
  function()
    require('harpoon.ui').nav_file(8)
  end,
  { desc = 'navigate to Harpoon mark 8' },
})
nmap({
  '<leader>m9',
  function()
    require('harpoon.ui').nav_file(9)
  end,
  { desc = 'navigate to Harpoon mark 9' },
})
nmap({
  '<leader>m0',
  function()
    require('harpoon.ui').nav_file(10)
  end,
  { desc = 'navigate to Harpoon mark 10' },
})
nmap({
  '<leader>mm',
  function()
    require('harpoon.ui').toggle_quick_menu()
  end,
  { desc = 'open Harpoon menu' },
})

-- git related {{{1
nmap({ '<leader>gs', '<cmd>Neogit<cr>' })
nmap({ '<leader>gj', '<cmd>diffget //3<cr>' })
nmap({ '<leader>gf', '<cmd>diffget //2<cr>' })
nmap({ '<leader>gg', ':Neogit ' })
nmap({ '<leader>gl', '<cmd>Neogit log<cr>' })
nmap({
  '<leader>gb',
  function()
    require('agitator').git_blame_toggle()
  end,
  { desc = 'toggle git blame' },
})
nmap({
  '<leader>gm',
  function()
    require('agitator').git_time_machine()
  end,
  { desc = 'open git time machine' },
})
nmap({ '<leader>gdo', '<cmd>DiffviewOpen<cr>' })
nmap({ '<leader>gdd', ':DiffviewOpen ' })
nmap({ '<leader>gdq', '<cmd>DiffviewClose<cr>' }) --- move this to DiffviewFile
nmap({ '<leader>gdh', '<cmd>DiffviewFileHistory<cr>' })
nmap({ '<leader>gdH', ':DiffviewFileHistory ' })

-- packer {{{1
nmap({ '<leader>pE', '<cmd>PluginEdit<cr>' })
nmap({
  '<leader>pI',
  function()
    require('packer').install()
  end,
  { desc = 'install plugins from packer' },
})
nmap({
  '<leader>pC',
  function()
    require('packer').compile()
  end,
  { desc = 'regenerate packer loader file' },
})
nmap({
  '<leader>pX',
  function()
    require('packer').clean()
  end,
  { desc = 'uninstall plugins from packer' },
})
nmap({
  '<leader>pU',
  function()
    require('packer').sync()
  end,
  { desc = 'update plugins' },
})

-- search {{{1
nmap({ '/', '/\\v' })
vim.cmd('cabbrev s/ s/\\v')
vim.cmd('cabbrev %s/ %s/\\v')

-- clear search reg/trailing white space {{{1
nmap({ '<leader>n', '<cmd>let @/=""<cr>', { silent = true } })
nmap({ '<leader>y', 'm`:%s/\\s\\+$//e<cr>``' })

-- notes {{{1
--TODO: might need to set silent = false
nmap({ '<leader>zn', '<cmd>ZkNew { title = vim.fn.input("Title: ") }<cr>' })
nmap({ '<leader>zo', '<cmd>ZkNotes { sort = { "modified" } }<cr>' })
nmap({ '<leader>zt', '<cmd>ZkTags<cr>' })
nmap({ '<leader>zf', '<cmd>ZkNotes { sort = { "modified" }, match = vim.fn.input("Search: ") }<cr>' })
vmap({ '<leader>zf', ":'<,'>ZkMatch<cr>" })

-- disable arrow keys {{{1
nmap({ '<up>', '<cmd>echoerr "---> k <---"<cr>' })
nmap({ '<down>', '<cmd>echoerr "---> j <---"<cr>' })
nmap({ '<left>', '<cmd>echoerr "---> h <---"<cr>' })
nmap({ '<right>', '<cmd>echoerr "---> l <---"<cr>' })
imap({ '<up>', '<cmd>echoerr "---> <c-]>k <---"<cr>' })
imap({ '<down>', '<cmd>echoerr "---> <c-]>j <---"<cr>' })
imap({ '<left>', '<cmd>echoerr "---> <c-]>h <---"<cr>' })
imap({ '<right>', '<cmd>echoerr "---> <c-]>l <---"<cr>' })
vmap({ '<up>', '<cmd>echoerr "---> k <---"<cr>' })
vmap({ '<down>', '<cmd>echoerr "---> j <---"<cr>' })
vmap({ '<left>', '<cmd>echoerr "---> h <---"<cr>' })
vmap({ '<right>', '<cmd>echoerr "---> l <---"<cr>' })
