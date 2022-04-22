-- helpers {{{1
T = require('telescope-custom')
local map = vim.api.nvim_set_keymap

--- operators overloading
local tbl_overload = {
  --- concatenate two tables using +
  __add = function(t1, t2)
    for i = 1, #t2 do
      t1[#t1 + 1] = t2[i]
    end

    return t1
  end,
}

--- map options (set metatable for operator overloading)
local noremap = { noremap = true }
setmetatable(noremap, tbl_overload)
local nowait = { nowait = true }
setmetatable(nowait, tbl_overload)
local silent = { silent = true }
setmetatable(silent, tbl_overload)
local script = { script = true }
setmetatable(script, tbl_overload)
local expr = { expr = true }
setmetatable(expr, tbl_overload)
local unique = { unique = true }
setmetatable(unique, tbl_overload)

local function mapto(mode, keymaps)
  if type(keymaps) == 'table' then
    for _, keymap in ipairs(keymaps) do
      map(mode, keymap.map, keymap.cmd, keymap.opts)
    end
  end
end

--[[
    mapping for normal mode
    @param keymaps
            - map: the assigned keymap
            - cmd: the cmd that should be assigned to map
            - opts: options for the keymap, optional
--]]
local function n(keymaps)
  mapto('n', keymaps)
end

--[[
    mapping for insert mode
    @param keymaps
            - map: the assigned keymap
            - cmd: the cmd that should be assigned to map
            - opts: options for the keymap, optional
--]]
local function i(keymaps)
  mapto('i', keymaps)
end

--[[
    mapping for visual mode
    @param keymaps
            - map: the assigned keymap
            - cmd: the cmd that should be assigned to map
            - opts: options for the keymap, optional
--]]
local function v(keymaps)
  mapto('v', keymaps)
end

--[[
    mapping for terminal mode
    @param keymaps
            - map: the assigned keymap
            - cmd: the cmd that should be assigned to map
            - opts: options for the keymap, optional
--]]
local function t(keymaps)
  mapto('t', keymaps)
end

--[[
    mapping for command mode
    @param keymaps
            - map: the assigned keymap
            - cmd: the cmd that should be assigned to map
            - opts: options for the keymap, optional
--]]
local function c(keymaps)
  mapto('c', keymaps)
end

--[[
    mapping for select mode
    @param keymaps
            - map: the assigned keymap
            - cmd: the cmd that should be assigned to map
            - opts: options for the keymap, optional
--]]
local function s(keymaps)
  mapto('s', keymaps)
end

--[[
    mapping for operator mode
    @param keymaps
            - map: the assigned keymap
            - cmd: the cmd that should be assigned to map
            - opts: options for the keymap, optional
--]]
local function x(keymaps)
  mapto('x', keymaps)
end

-- mapleader {{{1
n({
  { map = '<space>', cmd = '<nop>', opts = {} },
})
vim.g.mapleader = ' '

-- :source file {{{1
n({
  { map = '<leader>s', cmd = '<cmd>source<cr>', opts = noremap + silent },
})

-- spelling {{{1
n({
  {
    map = '<leader>c',
    cmd = '<cmd>setlocal spell! spelllang=en_gb<cr>',
    opts = noremap + silent,
  },
})

i({
  { map = '<c-c>', cmd = '<c-g>u<esc>[s1z=`]a<c-g>u', opts = noremap },
})

-- show highlight group {{{1
n({
  { map = '<f10>', cmd = '<cmd>TSHighlightCapturesUnderCursor<cr>', opts = noremap },

  -- quickhelp {{{1
  { map = '<leader>hh', cmd = ':h <c-r><c-w><cr>', opts = noremap },
})

-- terminal esc {{{1
t({
  { map = '<c-[>', cmd = '<c-\\><c-n>', opts = noremap },
})

-- termdebug {{{1
n({
  { map = '<leader>dt', cmd = ':Termdebug ', opts = noremap },
  { map = '<leader>dd', cmd = '<cmd>Gdb<cr>', opts = noremap + silent },
  { map = '<leader>dp', cmd = '<cmd>Program<cr>', opts = noremap + silent },
  { map = '<leader>ds', cmd = '<cmd>Source<cr>', opts = noremap + silent },
  { map = '<leader>da', cmd = '<cmd>Asm<cr>', opts = noremap + silent },
  { map = '<leader>dK', cmd = '<cmd>Evaluate<cr>', opts = noremap + silent },
  { map = '<leader>dr', cmd = '<cmd>Run<cr>', opts = noremap + silent },
  { map = '<leader>dA', cmd = ':Arguments ', opts = noremap },
  { map = '<leader>dB', cmd = '<cmd>Break<cr>', opts = noremap + silent },
  { map = '<leader>dC', cmd = '<cmd>Clear<cr>', opts = noremap + silent },
  { map = '<leader>dj', cmd = '<cmd>Step<cr>', opts = noremap + silent },
  { map = '<leader>dO', cmd = '<cmd>Over<cr>', opts = noremap + silent },
  { map = '<leader>dD', cmd = '<cmd>Finish<cr>', opts = noremap + silent },
  { map = '<leader>dc', cmd = '<cmd>Continue<cr>', opts = noremap + silent },
  { map = '<leader>dT', cmd = '<cmd>Stop<cr>', opts = noremap + silent },


  -- add new lines {{{1
  { map = '[<space>', cmd = 'm`O<esc>``', opts = noremap },
  { map = ']<space>', cmd = 'm`o<esc>``', opts = noremap },

  -- move line {{{1
  { map = '[e', cmd = '<cmd>move .-2<cr>', opts = noremap + silent },
  { map = ']e', cmd = '<cmd>move .+1<cr>', opts = noremap + silent },
})

v({
  { map = '[e', cmd = ":move '<-2<cr>gv=gv", opts = noremap + silent }, --- <cmd> does not do the job well
  { map = ']e', cmd = ":move '>+1<cr>gv=gv", opts = noremap + silent }, --- <cmd> does not do the job well
})

-- window resize {{{1
n({
  { map = '<m-h>', cmd = '<c-w><', opts = noremap },
  { map = '<m-l>', cmd = '<c-w>>', opts = noremap },
  { map = '<m-k>', cmd = '<c-w>+', opts = noremap },
  { map = '<m-j>', cmd = '<c-w>-', opts = noremap },
})

-- quickfix and local list navigation {{{1
n({
  { map = '[C', cmd = '<cmd>copen<cr>', opts = noremap },
  { map = ']C', cmd = '<cmd>cclose<cr>', opts = noremap },
  { map = '[L', cmd = '<cmd>lopen<cr>', opts = noremap },
  { map = ']L', cmd = '<cmd>lclose<cr>', opts = noremap },
  { map = '[c', cmd = '<cmd>cprevious<cr>', opts = noremap },
  { map = ']c', cmd = '<cmd>cnext<cr>', opts = noremap },
  { map = '[l', cmd = '<cmd>lprevious<cr>', opts = noremap },
  { map = ']l', cmd = '<cmd>lnext<cr>', opts = noremap },

  -- directory viewer and drawer {{{1
  { map = '<c-n>', cmd = '<cmd>Dirbuf<cr>', opts = noremap },
  { map = '<c-p>', cmd = '<cmd>NvimTreeToggle<cr>', opts = noremap },
})

-- snippet {{{1
local function prequire(...)
  local status, lib = pcall(require, ...)
  if (status) then return lib end

  return nil
end

local luasnip = prequire('luasnip')
local cmp = prequire("cmp")

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
        return tc("<Plug>luasnip-expand-or-jump")
    elseif check_back_space() then
        return tc "<c-k>"
    else
        cmp.complete()
    end
    return ""
end

_G.luasnip_jump_to_previous = function()
    if cmp and cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip and luasnip.jumpable(-1) then
        return tc("<Plug>luasnip-jump-prev")
    else
        return tc "<c-j>"
    end
    return ""
end

i({
  { map = "<c-k>", cmd = "v:lua.luasnip_expand_or_jump()", opts = expr } ,
  { map = "<c-j>", cmd = "v:lua.luasnip_jump_to_previous()", opts = expr },
  { map = "<c-h>", cmd = "<Plug>luasnip-next-choice", opts = {}},
})

s({
  { map = "<c-k>", cmd = "v:lua.luasnip_expand_or_jump()", opts = expr },
  { map = "<c-j>", cmd = "v:lua.luasnip_jump_to_previous()", opts = expr },
  { map = "<c-h>", cmd = "<Plug>luasnip-next-choice", opts = {} },
})

-- undotree {{{1
n({
  { map = '<leader>u', cmd = '<cmd>UndotreeToggle<cr>', opts = noremap },
})

-- treesitter {{{1
function _G.TSRestart()
  vim.cmd('write|edit')
end

n({
  {
    map = '<leader>tt',
    cmd = '<cmd>lua require("nvim-treesitter-playground.internal").toggle()<cr>',
    opts = noremap,
  },
  { map = '<leader>tr', cmd = '<cmd>lua TSRestart()<cr>', opts = noremap + silent },

  -- add tags (C/C++) {{{1
  { map = '[t', cmd = '<cmd>call jobstart("ctags -R")<cr>', opts = noremap },

  -- aedile {{{1
  { map = '<leader>rr', cmd = '<cmd>lua require("aedile").toggle_repl()<cr>', opts = noremap },
  { map = '<leader>rc', cmd = '<cmd>lua require("aedile").terminate_repl()<cr>', opts = noremap },

  -- slime {{{1
  { map = '<c-c><c-c>', cmd = ':<c-u>call slime#store_curpos()<cr>:set opfunc=slime#send_op<cr>g@af', opts = silent },
  { map = '<c-c>v', cmd = '<Plug>SlimeConfig', opts = {} },
})

x({
  { map = '<c-c><c-c>', cmd = '<Plug>SlimeRegionSend', opts = {} },
})

-- projectionist {{{1
n({
  { map = '<leader>pa', cmd = '<cmd>A<cr>', opts = noremap },
  { map = '<leader>ps', cmd = ':AS ', opts = noremap },
  { map = '<leader>pv', cmd = ':AV ', opts = noremap },
  { map = '<leader>pt', cmd = ':AT ', opts = noremap },
  { map = '<leader>po', cmd = ':AO ', opts = noremap },
  { map = '<leader>pd', cmd = '<cmd>AD<cr>', opts = noremap },

  -- telescope {{{1
  { map = '<leader>ff', cmd = '<cmd>lua T.rg()<cr>', opts = noremap },
  { map = '<leader>fd', cmd = '<cmd>lua T.rg_dot()<cr>', opts = noremap },
  { map = '<leader>fn', cmd = '<cmd>lua T.rg_note()<cr>', opts = noremap },
  { map = '<leader>fg', cmd = '<cmd>lua T.git_branches()<cr>', opts = noremap },
  { map = '<leader>fr', cmd = '<cmd>lua T.live_grep()<cr>', opts = noremap },
  { map = '<leader>fb', cmd = '<cmd>lua T.buffers()<cr>', opts = noremap },
  { map = '<leader>fl', cmd = '<cmd>lua T.current_buffer_fuzzy_find()<cr>', opts = noremap },
  { map = '<leader>fh', cmd = '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts = noremap },
  { map = '<leader>fq', cmd = '<cmd>lua require("telescope.builtin").quickfix()<cr>', opts = noremap },
  { map = '<leader>ft', cmd = '<cmd>lua require("telescope.builtin").tags()<cr>', opts = noremap },
  { map = '<leader>fw', cmd = '<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<cr>', opts = noremap },
  {
    map = '<leader>fm',
    cmd = '<cmd>lua require("telescope.builtin").keymaps()<cr>',
    opts = noremap + nowait,
  },
  {
    map = '<leader>fs',
    cmd = '<cmd>lua require("telescope").extensions.souvenir.souvenir()<cr>',
    opts = noremap + nowait,
  },
})

c({
  {
    map = '<c-r><c-r>',
    cmd = '<cmd>lua require("telescope.builtin").commands()<cr><cr>',
    opts = noremap + nowait,
  },
})

n({
  -- harpoon {{{1
  { map = '<leader>ma', cmd = '<cmd>lua require("harpoon.mark").add_file()<cr>', opts = noremap },
  { map = '<leader>m1', cmd = '<cmd>lua require("harpoon.ui").nav_file(1)<cr>', opts = noremap },
  { map = '<leader>m2', cmd = '<cmd>lua require("harpoon.ui").nav_file(2)<cr>', opts = noremap },
  { map = '<leader>m3', cmd = '<cmd>lua require("harpoon.ui").nav_file(3)<cr>', opts = noremap },
  { map = '<leader>m4', cmd = '<cmd>lua require("harpoon.ui").nav_file(4)<cr>', opts = noremap },
  { map = '<leader>m5', cmd = '<cmd>lua require("harpoon.ui").nav_file(5)<cr>', opts = noremap },
  { map = '<leader>m6', cmd = '<cmd>lua require("harpoon.ui").nav_file(6)<cr>', opts = noremap },
  { map = '<leader>m7', cmd = '<cmd>lua require("harpoon.ui").nav_file(7)<cr>', opts = noremap },
  { map = '<leader>m8', cmd = '<cmd>lua require("harpoon.ui").nav_file(8)<cr>', opts = noremap },
  { map = '<leader>m9', cmd = '<cmd>lua require("harpoon.ui").nav_file(9)<cr>', opts = noremap },
  { map = '<leader>m0', cmd = '<cmd>lua require("harpoon.ui").nav_file(10)<cr>', opts = noremap },
  { map = '<leader>mm', cmd = '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', opts = noremap },

  -- git related {{{1
  { map = '<leader>gs', cmd = '<cmd>Neogit<cr>', opts = noremap },
  { map = '<leader>gj', cmd = '<cmd>diffget //3<cr>', opts = noremap },
  { map = '<leader>gf', cmd = '<cmd>diffget //2<cr>', opts = noremap },
  { map = '<leader>gg', cmd = ':Neogit ', opts = noremap },
  { map = '<leader>gl', cmd = '<cmd>Neogit log<cr>', opts = noremap },
  { map = '<leader>gb', cmd = '<cmd>lua require("agitator").git_blame_toggle()<cr>', opts = noremap },
  { map = '<leader>gm', cmd = '<cmd>lua require("agitator").git_time_machine()<cr>', opts = noremap },
  { map = '<leader>gdo', cmd = '<cmd>DiffviewOpen<cr>', opts = noremap },
  { map = '<leader>gdd', cmd = ':DiffviewOpen ', opts = noremap },
  { map = '<leader>gdq', cmd = '<cmd>DiffviewClose<cr>', opts = noremap },   --- move this to DiffviewFiles
  { map = '<leader>gdh', cmd = '<cmd>DiffviewFileHistory<cr>', opts = noremap },
  { map = '<leader>gdH', cmd = ':DiffviewFileHistory ', opts = noremap },

  -- packer {{{1
  { map = '<leader>pE', cmd = '<cmd>PluginEdit<cr>', opts = noremap },
  { map = '<leader>pI', cmd = '<cmd>lua require("packer").install()<cr>', opts = noremap },
  { map = '<leader>pC', cmd = '<cmd>lua require("packer").compile()<cr>', opts = noremap },
  { map = '<leader>pX', cmd = '<cmd>lua require("packer").clean()<cr>', opts = noremap },
  { map = '<leader>pU', cmd = '<cmd>lua require("packer").sync()<cr>', opts = noremap },

  -- search {{{1
  { map = '/', cmd = '/\\v', opts = noremap },
})

vim.cmd('cabbrev s/ s/\\v')
vim.cmd('cabbrev %s/ %s/\\v')

-- clear search reg/trailing white space {{{1
n({
  { map = '<leader>n', cmd = '<cmd>let @/=""<cr>', opts = noremap + silent },
  { map = '<leader>y', cmd = 'm`:%s/\\s\\+$//e<cr>``', opts = noremap },

  -- notes {{{1
  --TODO: might need to set silent = false
  { map = '<leader>zn', cmd = '<cmd>ZkNew { title = vim.fn.input("Title: ") }<cr>', opts = noremap },
  { map = '<leader>zo', cmd = '<cmd>ZkNotes { sort = { "modified" } }<cr>', opts = noremap },
  { map = '<leader>zt', cmd = '<cmd>ZkTags<cr>', opts = noremap },
  {
    map = '<leader>zf',
    cmd = '<cmd>ZkNotes { sort = { "modified" }, match = vim.fn.input("Search: ") }<cr>',
    opts = noremap,
  },
})

v({
  { map = '<leader>zf', cmd = ":'<,'>ZkMatch<cr>", opts = noremap },

  -- disable arrow keys {{{1
  { map = '<up>', cmd = '<cmd>echoerr "---> k <---"<cr>', opts = noremap },
  { map = '<down>', cmd = '<cmd>echoerr "---> j <---"<cr>', opts = noremap },
  { map = '<left>', cmd = '<cmd>echoerr "---> h <---"<cr>', opts = noremap },
  { map = '<right>', cmd = '<cmd>echoerr "---> l <---"<cr>', opts = noremap },
})

n({
  { map = '<up>', cmd = '<cmd>echoerr "---> k <---"<cr>', opts = noremap },
  { map = '<down>', cmd = '<cmd>echoerr "---> j <---"<cr>', opts = noremap },
  { map = '<left>', cmd = '<cmd>echoerr "---> h <---"<cr>', opts = noremap },
  { map = '<right>', cmd = '<cmd>echoerr "---> l <---"<cr>', opts = noremap },
})

i({
  { map = '<up>', cmd = '<cmd>echoerr "---> <c-]>k <---"<cr>', opts = noremap },
  { map = '<down>', cmd = '<cmd>echoerr "---> <c-]>j <---"<cr>', opts = noremap },
  { map = '<left>', cmd = '<cmd>echoerr "---> <c-]>h <---"<cr>', opts = noremap },
  { map = '<right>', cmd = '<cmd>echoerr "---> <c-]>l <---"<cr>', opts = noremap },
})
