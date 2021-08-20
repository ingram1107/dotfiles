-- mapleader {{{1
vim.api.nvim_set_keymap('n', '<space>', '<nop>', {})
vim.g.mapleader = ' '

-- :source file {{{1
vim.api.nvim_set_keymap('n', '<leader>s', '<cmd>source %<cr>', { noremap = true, silent = true })

-- spelling {{{1
vim.api.nvim_set_keymap('n', '<leader>c', '<cmd>setlocal spell! spelllang=en_gb<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<c-c>', '<c-g>u<esc>[s1z=`]a<c-g>u', { noremap = true })

-- show highlight group {{{1
function HlGrpStr()
  local line = vim.fn.line(".")
  local col = vim.fn.col(".")
  local hl_bit = 1
  local trans_bit = 0

  local hl_syn_id = vim.fn.synID(line, col, hl_bit)
  local trans_syn_id = vim.fn.synID(line, col, trans_bit)
  local syn_grp_id = vim.fn.synIDtrans(hl_syn_id)

  local hl_syn_name = vim.fn.synIDattr(hl_syn_id, 'name')
  local trans_syn_name = vim.fn.synIDattr(trans_syn_id, 'name')
  local syn_grp_name = vim.fn.synIDattr(syn_grp_id, 'name')

  return 'hi<'..hl_syn_name..'> trans<'..trans_syn_name..'> lo<'..syn_grp_name..'>'
end

vim.api.nvim_set_keymap('n', '<f10>', '<cmd>lua print(HlGrpStr())<cr>', { noremap = true })

-- quickhelp {{{1
vim.api.nvim_set_keymap('n', '<leader>hh', ':h <c-r><c-w><cr>', { noremap = true })

-- terminal esc {{{1
vim.api.nvim_set_keymap('t', '<c-[>', '<c-\\><c-n>', { noremap = true })

-- termdebug {{{1
vim.api.nvim_set_keymap('n', '<leader>dt', ':Termdebug ', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Gdb<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dp', '<cmd>Program<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ds', '<cmd>Source<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>da', '<cmd>Asm<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dK', '<cmd>Evaluate<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dr', '<cmd>Run<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dA', ':Arguments ', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>dB', '<cmd>Break<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dC', '<cmd>Clear<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dj', '<cmd>Step<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dO', '<cmd>Over<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dD', '<cmd>Finish<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dc', '<cmd>Continue<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dT', '<cmd>Stop<cr>', { noremap = true, silent = true })

-- dirvish {{{1
vim.api.nvim_set_keymap('n', '<c-n>', '<Plug>(dirvish_up)', { silent = true })

-- add new lines {{{1
vim.api.nvim_set_keymap('n', '[<space>', 'm`O<esc>``', { noremap = true })
vim.api.nvim_set_keymap('n', ']<space>', 'm`o<esc>``', { noremap = true })

-- move line {{{1
vim.api.nvim_set_keymap('n', '[e', '<cmd>move .-2<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']e', '<cmd>move .+1<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '[e', ":move '<-2<cr>gv=gv", { noremap = true, silent = true })  --- <cmd> does not do the job well
vim.api.nvim_set_keymap('v', ']e', ":move '>+1<cr>gv=gv", { noremap = true, silent = true })  --- <cmd> does not do the job well

-- window resize {{{1
vim.api.nvim_set_keymap('n', '<m-h>', '<c-w><', { noremap = true })
vim.api.nvim_set_keymap('n', '<m-l>', '<c-w>>', { noremap = true })
vim.api.nvim_set_keymap('n', '<m-k>', '<c-w>+', { noremap = true })
vim.api.nvim_set_keymap('n', '<m-j>', '<c-w>-', { noremap = true })

-- quickfix and local list navigation {{{1
vim.api.nvim_set_keymap('n', '[C', '<cmd>copen<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', ']C', '<cmd>cclose<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '[L', '<cmd>lopen<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', ']L', '<cmd>lclose<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '[c', '<cmd>cprevious<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', ']c', '<cmd>cnext<cr>', { noremap = true } )
vim.api.nvim_set_keymap('n', '[l', '<cmd>lprevious<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', ']l', '<cmd>lnext<cr>', { noremap = true })

-- drawer {{{1
vim.api.nvim_set_keymap('n', '<c-p>', '<cmd>NvimTreeToggle<cr>', { noremap = true })

-- completion {{{1
local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function check_bs()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

function _G.tab_complete()
  if vim.fn.pumvisible() == 1 then
    return t '<c-n>'
  elseif check_bs() then
    return t '<tab>'
  else
    return vim.fn['compe#complete']()
  end
end

function _G.s_tab_complete()
  if vim.fn.pumvisible() == 1 then
    return t '<c-p>'
  else
    return t '<s-tab>'
  end
end

vim.api.nvim_set_keymap('i', '<tab>', 'v:lua.tab_complete()', { silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<s-tab>', 'v:lua.s_tab_complete()', { silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<c-e>', 'compe#close("<c-e>")', { noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<c-f>', 'compe#scroll({"delta":+4})', { noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<c-b>', 'compe#scroll({"delta":-4})', { noremap = true, silent = true, expr = true})

-- snippet {{{1
-- local ls = require('luasnip')



-- function _G.tab_complete()
--   if vim.fn.pumvisible() == 1 then
--     return t '<c-n>'
--   elseif ls and ls.expand_or_jumpable() then
--     return t '<plug>luasnip-expand-or-jump'
--   elseif check_bs() then
--     return t '<tab>'
--   else
--     return vim.fn['compe#complete']()
--   end
-- end

-- function _G.s_tab_complete()
--   if vim.fn.pumvisible() == 1 then
--     return t '<c-p>'
--   elseif ls and ls.jumpable(-1) then
--     return t '<plug>luasnip-jump-prev'
--   else
--     return t '<s-tab>'
--   end
-- end

-- vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', { expr = true })
-- vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', { expr = true })
-- vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
-- vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', { expr = true })
-- vim.api.nvim_set_keymap('i', '<C-E>', '<Plug>luasnip-next-choice', { })
-- vim.api.nvim_set_keymap('s', '<C-E>', '<Plug>luasnip-next-choice', { })

-- undotree {{{1
vim.api.nvim_set_keymap('n', '<leader>u', '<cmd>UndotreeToggle<cr>', { noremap = true })

-- treesitter {{{1
function TSRestart()
  vim.api.nvim_exec('write|edit', false)
end

vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>lua require("nvim-treesitter-playground.internal").toggle()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>tr', '<cmd>lua TSRestart()<cr>', { noremap = true, silent=true })

-- add tags (C/C++) {{{1
vim.api.nvim_set_keymap('n', '[t', '<cmd>call jobstart("ctags -R")<cr>', { noremap = true })

-- aedile {{{1
vim.api.nvim_set_keymap('n', '<leader>rr', '<cmd>lua require("aedile").toggle_repl()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rc', '<cmd>lua require("aedile").terminate_repl()<cr>', { noremap = true })

-- slime {{{1
vim.api.nvim_set_keymap('n', '<c-c><c-c>', ':<c-u>call slime#store_curpos()<cr>:set opfunc=slime#send_op<cr>g@af', { silent = true })
vim.api.nvim_set_keymap('x', '<c-c><c-c>', '<Plug>SlimeRegionSend', {})
vim.api.nvim_set_keymap('n', '<c-c>v', '<Plug>SlimeConfig', {})

-- projectionist {{{1
vim.api.nvim_set_keymap('n', '<leader>pa', '<cmd>A<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ps', ':AS ', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pv', ':AV ', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pt', ':AT ', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>po', ':AO ', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pd', '<cmd>AD<cr>', { noremap = true })

-- telescope {{{1
T = require('telescope-custom')

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua T.rg()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fd', '<cmd>lua T.rg_dot()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua T.git_branches()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fr', '<cmd>lua T.live_grep()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>lua T.buffers()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fl', '<cmd>lua T.current_buffer_fuzzy_find()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fq', '<cmd>lua require("telescope.builtin").quickfix()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ft', '<cmd>lua require("telescope.builtin").tags()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fw', '<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>fm', '<cmd>lua require("telescope.builtin").keymaps()<cr>', { noremap = true, nowait = true })
vim.api.nvim_set_keymap('c', '<c-r><c-r>', '<cmd>lua require("telescope.builtin").commands()<cr><cr>', { noremap = true, nowait = true })

-- git related {{{1
vim.api.nvim_set_keymap('n', '<leader>gs', '<cmd>Neogit<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gj', '<cmd>diffget //3<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gf', '<cmd>diffget //2<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gg', ':Neogit ', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>gl', '<cmd>Neogit log<cr>', { noremap = true })

-- packer {{{1
vim.api.nvim_set_keymap('n', '<leader>pI', '<cmd>lua require("packer").install()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pC', '<cmd>lua require("packer").compile()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pX', '<cmd>lua require("packer").clean()<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>pU', '<cmd>lua require("packer").sync()<cr>', { noremap = true })

-- search {{{1
vim.api.nvim_set_keymap('n', '/', '/\\v', { noremap = true })
vim.api.nvim_exec('cabbrev s/ s/\\v', false)
vim.api.nvim_exec('cabbrev %s/ %s/\\v', false)

-- clear search reg/trailing white space {{{1
vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>let @/=""<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>y', 'm`:%s/\\s\\+$//e<cr>``', { noremap = true })

-- notes {{{1
vim.api.nvim_set_keymap('n', '<leader>ww', '<Plug>VimwikiIndex', {})

-- disable arrow keys {{{1
vim.api.nvim_set_keymap('n', '<up>', '<cmd>echoerr "---> k <---"<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<down>', '<cmd>echoerr "---> j <---"<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<left>', '<cmd>echoerr "---> h <---"<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<right>', '<cmd>echoerr "---> l <---"<cr>', { noremap = true })
vim.api.nvim_set_keymap('i', '<up>', '<cmd>echoerr "---> <c-]>k <---"<cr>', { noremap = true })
vim.api.nvim_set_keymap('i', '<down>', '<cmd>echoerr "---> <c-]>j <---"<cr>', { noremap = true })
vim.api.nvim_set_keymap('i', '<left>', '<cmd>echoerr "---> <c-]>h <---"<cr>', { noremap = true })
vim.api.nvim_set_keymap('i', '<right>', '<cmd>echoerr "---> <c-]>l <---"<cr>', { noremap = true })
vim.api.nvim_set_keymap('v', '<up>', '<cmd>echoerr "---> k <---"<cr>', { noremap = true })
vim.api.nvim_set_keymap('v', '<down>', '<cmd>echoerr "---> j <---"<cr>', { noremap = true })
vim.api.nvim_set_keymap('v', '<left>', '<cmd>echoerr "---> h <---"<cr>', { noremap = true })
vim.api.nvim_set_keymap('v', '<right>', '<cmd>echoerr "---> l <---"<cr>', { noremap = true })
