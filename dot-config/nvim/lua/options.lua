-- general {{{1
vim.o.backupcopy = 'no'
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.concealcursor = 'nc'
vim.o.conceallevel = 2
vim.o.encoding = 'utf8'
vim.o.equalalways = false
vim.o.formatoptions = 'jcrqlnB'
vim.o.guicursor = 'n-v-i-c-sm:block,ci-ve:ver25,r-cr:hor20'
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.inccommand = 'nosplit'
vim.o.laststatus = 3
vim.o.lazyredraw = true
vim.o.modelines = 0
vim.o.number = true
vim.o.path = '.,**'
vim.o.pumblend = 25
vim.o.pumheight = 6
vim.o.relativenumber = true
vim.o.scrollback = 100000
vim.o.scrolloff = 10
vim.o.showmode = false
vim.o.signcolumn = 'yes:1'
vim.o.smartcase = true
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.updatetime = 10
vim.o.viewoptions = 'folds'
vim.o.wildignore = '*.o,*.obj,__pycache__,*.pyc,*pycache'
vim.o.wildmode = 'longest,full'
vim.o.wildoptions = 'pum'
vim.o.wrap = false

-- indentation {{{1
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- folding {{{1
function _G.simple_fold()
  local first = vim.fn.getline(vim.v.foldstart)
  local last = vim.fn.trim(vim.fn.getline(vim.v.foldend))
  return first .. '...' .. last
end

vim.o.foldenable = true
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevelstart = 99
vim.o.foldtext = 'v:lua.simple_fold()'

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- completion {{{1
vim.o.completeopt = 'menuone,noselect'
vim.o.shortmess = vim.o.shortmess .. 'c'

-- better terminal integration {{{1
local terminal_group = vim.api.nvim_create_augroup('BetterTerminal', { clear = true })

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = 'term://*',
  command = 'startinsert',
  group = terminal_group,
})

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = 'term://*',
  callback = function()
    vim.api.nvim_set_option_value('cursorline', false, { scope = 'local' })
    vim.api.nvim_set_option_value('number', false, { scope = 'local' })
    vim.api.nvim_set_option_value('relativenumber', false, { scope = 'local' })
  end,
  group = terminal_group,
})

vim.api.nvim_create_autocmd('TermLeave', {
  pattern = 'term://*',
  command = 'stopinsert',
  group = terminal_group,
})

-- termdebug {{{1
vim.g.termdebug_wide = 40

-- theme {{{1
vim.cmd('colo zhi')

-- tabline {{{1
function _G.tabline()
  local s = ''
  for i, _ in ipairs(vim.api.nvim_list_tabpages()) do
    if i == vim.api.nvim_tabpage_get_number(0) then
      s = s .. '%#TabLineSel#'
    else
      s = s .. '%#TabLine#'
    end

    s = s .. ' %{v:lua.tablabel(' .. i .. ')} '
  end

  s = s .. '%#TabLineFill#%T'

  return s
end

function _G.tablabel(tab_no)
  local buf_list = vim.fn.tabpagebuflist(tab_no)
  local win_no = vim.api.nvim_win_get_number(vim.api.nvim_tabpage_get_win(tab_no))
  local buf_name = vim.fn.bufname(buf_list[win_no])

  if buf_name ~= '' or buf_name ~= nil then
    return '[' .. buf_name .. ']'
  else
    return '[' .. ']'
  end
end

vim.o.tabline = '%!v:lua.tabline()'

-- listchars {{{1
vim.o.list = true
vim.o.listchars = 'tab:» ,eol:↲'

-- fillchars {{{1
vim.o.fillchars = 'fold: '

-- yank highlight {{{1
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
})

-- loadview for config files {{{1
local view_group = vim.api.nvim_create_augroup('ConfigLoadView', { clear = true })
local nvim_conf_path = os.getenv('HOME') .. '/dotfiles/dot-config/nvim/'

vim.api.nvim_create_autocmd('BufRead', {
  pattern = nvim_conf_path .. 'lua/keymaps.lua',
  command = 'silent! loadview',
  group = view_group,
})

vim.api.nvim_create_autocmd('BufRead', {
  pattern = nvim_conf_path .. 'lua/options.lua',
  command = 'silent! loadview',
  group = view_group,
})

vim.api.nvim_create_autocmd('BufRead', {
  pattern = nvim_conf_path .. 'plugin/plugins.lua',
  command = 'silent! loadview',
  group = view_group,
})

-- nvim-tree auto close
-- TODO: inconsistent behaviour across Vimscript and Lua
local nvim_tree_group = vim.api.nvim_create_augroup('NvimTreeAutoClose', { clear = true })

vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Auto quit the tab/vim if the last window is nvim-tree',
  pattern = '*',
  nested = true,
  callback = function()
    local windows = vim.api.nvim_tabpage_list_wins(0)
    local winnr = #windows
    local bufname = vim.api.nvim_buf_get_name(0)
    local tabpagenr = vim.api.nvim_win_get_tabpage(0)
    local match_bufname = 'NvimTree_' .. tabpagenr

    if winnr == 1 and bufname == match_bufname then
      vim.cmd('quit')
    end
  end,
  group = nvim_tree_group,
})
