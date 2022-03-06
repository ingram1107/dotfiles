-- general {{{1
vim.cmd('filetype plugin on')
vim.o.backupcopy = 'no'
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.concealcursor = 'nc'
vim.o.conceallevel = 2
vim.o.encoding = 'utf8'
vim.o.equalalways = false
vim.o.formatoptions = 'jcrqlnB'
vim.o.guicursor = "n-v-i-c-sm:block,ci-ve:ver25,r-cr:hor20"
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.inccommand = 'nosplit'
vim.o.modelines = 0
vim.o.number = true
vim.o.path = '.,**'
vim.o.pumblend = 25
vim.o.pumheight = 6
vim.o.relativenumber = true
vim.o.scrollback = 100000
vim.o.scrolloff = 10
vim.o.showmode = false
vim.o.signcolumn = "yes:1"
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
vim.cmd('filetype plugin indent on')
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- folding {{{1
function _G.simple_fold()
  local first = vim.fn.getline(vim.v.foldstart)
  local last = vim.fn.trim(vim.fn.getline(vim.v.foldend))
  return first..'...'..last
end

vim.o.foldenable = true
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevelstart = 99
vim.o.foldtext = 'v:lua.simple_fold()'

-- completion {{{1
vim.o.completeopt = 'menuone,noselect'
vim.o.shortmess = vim.o.shortmess .. 'c'

-- better terminal integration {{{1
--- TODO: neovim/neovim autocmd native lua callback PR#12378 and PR#14661
vim.cmd([[
aug BetterTerminal
  au!
  au TermOpen term://* startinsert
  au TermOpen term://* setlocal nocursorline nonumber norelativenumber
  au TermLeave term://* stopinsert
aug END
]])

-- termdebug {{{1
vim.g.termdebug_wide = 40

-- theme {{{1
vim.cmd('colo monokai_ristretto')

-- tabline {{{1
function _G.tabline()
  local s = ''
  for i, _ in ipairs(vim.api.nvim_list_tabpages()) do
    if i == vim.api.nvim_tabpage_get_number(0) then
      s = s..'%#TabLineSel#'
    else
      s = s..'%#TabLine#'
    end

    s = s..' %{v:lua.tablabel('..i..')} '
  end

  s = s..'%#TabLineFill#%T'

  return s
end

function _G.tablabel(tab_no)
  local buf_list = vim.fn.tabpagebuflist(tab_no)
  local win_no = vim.api.nvim_win_get_number(vim.api.nvim_tabpage_get_win(tab_no))
  local buf_name = vim.fn.bufname(buf_list[win_no])

  if buf_name ~= '' or buf_name ~= nil then
    return '[' ..buf_name..']'
  else
    return '['..']'
  end
end

vim.o.tabline='%!v:lua.tabline()'

-- listchars {{{1
vim.o.list = true
vim.o.listchars = 'tab:» ,eol:↲'

-- fillchars {{{1
vim.o.fillchars = 'fold: '

-- yank highlight {{{1
--- TODO: neovim/neovim autocmd native lua callback PR#12378 and PR#14661
vim.cmd('au TextYankPost * silent! lua vim.highlight.on_yank()')


-- loadview for config files {{{1
vim.cmd([[
aug ConfigLoadView
  au!
  au BufRead $HOME/dotfiles/dot-config/nvim/lua/keymaps.lua silent! loadview
  au BufRead $HOME/dotfiles/dot-config/nvim/lua/options.lua silent! loadview
  au BufRead $HOME/dotfiles/dot-config/nvim/plugin/plugins.lua silent! loadview
aug END
]])
