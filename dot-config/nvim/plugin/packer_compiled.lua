-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/clover/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/clover/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/clover/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/clover/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/clover/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["aedile.nvim"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/aedile.nvim"
  },
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["emmet-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/clover/.local/share/nvim/site/pack/packer/opt/emmet-vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\2ﾝ\5\0\0\4\0\22\0\0254\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\0023\3\n\0:\3\v\0023\3\f\0:\3\r\2:\2\15\0013\2\16\0003\3\17\0:\3\18\0023\3\19\0:\3\20\2:\2\21\1>\0\2\1G\0\1\0\fkeymaps\tn [g\1\2\1\0@&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'\texpr\2\tn ]g\1\2\1\0@&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'\texpr\2\1\0\2\vbuffer\2\fnoremap\2\nsigns\1\0\0\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\b窶ｾ\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6_\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\b笆十nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\b笆十nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  moneokai = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/moneokai"
  },
  neogit = {
    commands = { "Neogit" },
    config = { "\27LJ\1\0028\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\vneogit\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/opt/neogit"
  },
  neorg = {
    loaded = false,
    needs_bufread = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/opt/neorg"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/home/clover/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["orgmode.nvim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/opt/orgmode.nvim"
  },
  ["origin.nvim"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/origin.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/clover/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["remote-viewer"] = {
    commands = { "Dirvish" },
    loaded = false,
    needs_bufread = false,
    path = "/home/clover/.local/share/nvim/site/pack/packer/opt/remote-viewer"
  },
  ["sass-compiler.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/clover/.local/share/nvim/site/pack/packer/opt/sass-compiler.vim"
  },
  ["souvenir.nvim"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/souvenir.nvim"
  },
  ["startuptime.vim"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    path = "/home/clover/.local/share/nvim/site/pack/packer/opt/startuptime.vim"
  },
  tabular = {
    after_files = { "/home/clover/.local/share/nvim/site/pack/packer/opt/tabular/after/plugin/TabularMaps.vim" },
    commands = { "Tab" },
    loaded = false,
    needs_bufread = false,
    path = "/home/clover/.local/share/nvim/site/pack/packer/opt/tabular"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/home/clover/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dirvish"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/vim-dirvish"
  },
  ["vim-dirvish-dovish"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/opt/vim-dirvish-dovish"
  },
  ["vim-eunuch"] = {
    commands = { "Delete", "Unlink", "Remove", "Rename", "Chmod", "Mkdir", "SudoEdit", "SudoWrite" },
    loaded = false,
    needs_bufread = false,
    path = "/home/clover/.local/share/nvim/site/pack/packer/opt/vim-eunuch"
  },
  ["vim-fish"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/vim-fish"
  },
  ["vim-grammarous"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/clover/.local/share/nvim/site/pack/packer/opt/vim-grammarous"
  },
  ["vim-instant-markdown"] = {
    config = { "\27LJ\1\2R\0\0\3\0\4\0\a4\0\0\0007\0\1\0007\0\2\0%\1\3\0)\2\1\0>\0\3\1G\0\1\0!packadd vim-instant-markdown\14nvim_exec\bapi\bvim\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/opt/vim-instant-markdown"
  },
  ["vim-ledger"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/vim-ledger"
  },
  ["vim-matchup"] = {
    config = { "\27LJ\1\2>\0\0\2\0\3\0\0054\0\0\0007\0\1\0002\1\0\0:\1\2\0G\0\1\0!matchup_matchparen_offscreen\6g\bvim\0" },
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-projectionist"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/vim-projectionist"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-sexp"] = {
    config = { "\27LJ\1\2F\0\0\3\0\4\0\a4\0\0\0007\0\1\0007\0\2\0%\1\3\0)\2\1\0>\0\3\1G\0\1\0\21packadd vim-sexp\14nvim_exec\bapi\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/clover/.local/share/nvim/site/pack/packer/opt/vim-sexp"
  },
  ["vim-slime"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/opt/vim-slime"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/opt/vimtex"
  },
  vimwiki = {
    commands = { "VimwikiIndex" },
    keys = { { "", "n" }, { "", "<leader>ww" } },
    loaded = false,
    needs_bufread = true,
    path = "/home/clover/.local/share/nvim/site/pack/packer/opt/vimwiki"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: vim-matchup
time([[Config for vim-matchup]], true)
try_loadstring("\27LJ\1\2>\0\0\2\0\3\0\0054\0\0\0007\0\1\0002\1\0\0:\1\2\0G\0\1\0!matchup_matchparen_offscreen\6g\bvim\0", "config", "vim-matchup")
time([[Config for vim-matchup]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\2ﾝ\5\0\0\4\0\22\0\0254\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\0023\3\n\0:\3\v\0023\3\f\0:\3\r\2:\2\15\0013\2\16\0003\3\17\0:\3\18\0023\3\19\0:\3\20\2:\2\21\1>\0\2\1G\0\1\0\fkeymaps\tn [g\1\2\1\0@&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'\texpr\2\tn ]g\1\2\1\0@&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'\texpr\2\1\0\2\vbuffer\2\fnoremap\2\nsigns\1\0\0\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\b窶ｾ\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\6_\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\b笆十nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\b笆十nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
if vim.fn.exists(":Mkdir") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Mkdir lua require("packer.load")({'vim-eunuch'}, { cmd = "Mkdir", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Tab") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Tab lua require("packer.load")({'tabular'}, { cmd = "Tab", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Neogit") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":NvimTreeToggle") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Rename") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Rename lua require("packer.load")({'vim-eunuch'}, { cmd = "Rename", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":VimwikiIndex") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file VimwikiIndex lua require("packer.load")({'vimwiki'}, { cmd = "VimwikiIndex", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":UndotreeToggle") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Unlink") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Unlink lua require("packer.load")({'vim-eunuch'}, { cmd = "Unlink", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":StartupTime") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Remove") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Remove lua require("packer.load")({'vim-eunuch'}, { cmd = "Remove", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":SudoWrite") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file SudoWrite lua require("packer.load")({'vim-eunuch'}, { cmd = "SudoWrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":SudoEdit") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file SudoEdit lua require("packer.load")({'vim-eunuch'}, { cmd = "SudoEdit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Chmod") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Chmod lua require("packer.load")({'vim-eunuch'}, { cmd = "Chmod", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Dirvish") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Dirvish lua require("packer.load")({'remote-viewer'}, { cmd = "Dirvish", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
if vim.fn.exists(":Delete") ~= 2 then
vim.cmd [[command! -nargs=* -range -bang -complete=file Delete lua require("packer.load")({'vim-eunuch'}, { cmd = "Delete", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
end
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> n <cmd>lua require("packer.load")({'vimwiki'}, { keys = "n", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>ww <cmd>lua require("packer.load")({'vimwiki'}, { keys = "<lt>leader>ww", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType gitcommit ++once lua require("packer.load")({'vim-grammarous'}, { ft = "gitcommit" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'emmet-vim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType vimwiki ++once lua require("packer.load")({'vim-grammarous'}, { ft = "vimwiki" }, _G.packer_plugins)]]
vim.cmd [[au FileType lisp ++once lua require("packer.load")({'vim-slime', 'vim-sexp'}, { ft = "lisp" }, _G.packer_plugins)]]
vim.cmd [[au FileType scss ++once lua require("packer.load")({'sass-compiler.vim'}, { ft = "scss" }, _G.packer_plugins)]]
vim.cmd [[au FileType text ++once lua require("packer.load")({'vim-grammarous'}, { ft = "text" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-grammarous', 'vim-instant-markdown'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'emmet-vim'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'vim-slime'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType dirvish ++once lua require("packer.load")({'vim-dirvish-dovish'}, { ft = "dirvish" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vim-grammarous', 'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/clover/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /home/clover/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /home/clover/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
