-- packer conf
vim.api.nvim_exec('packadd packer.nvim', false)
vim.api.nvim_exec('packadd termdebug', false)

return require('packer').startup(function()
 -- load packer {{{1
 use { 'wbthomason/packer.nvim', opt = true }

 -- benchmark {{{1
 use {
   'tweekmonster/startuptime.vim',
   cmd = { 'StartupTime', }
 }

 -- theme {{{1
 use '/mnt/Nemo/git/moneokai'

 -- statusline and tabline {{{1
 use 'hoob3rt/lualine.nvim'

 -- syntax and debug {{{1
 use {
   'nvim-treesitter/nvim-treesitter',
   run = ':TSUpdate',
 }
 use {
   'nvim-treesitter/nvim-treesitter-textobjects',
   requires = 'nvim-treesitter/nvim-treesitter',
 }
 use {
   'p00f/nvim-ts-rainbow',
   requires = 'nvim-treesitter/nvim-treesitter',
 }
 use {
   'romgrk/nvim-treesitter-context',
   requires = 'nvim-treesitter/nvim-treesitter',
 }
 use {
   'JoosepAlviste/nvim-ts-context-commentstring',
   requires = 'nvim-treesitter/nvim-treesitter',
 }
 use {
   'nvim-treesitter/playground',
   requires = 'nvim-treesitter/nvim-treesitter',
 }
 use 'dag/vim-fish'
 use {
   'lervag/vimtex',
   ft = 'tex',
 }

 -- format {{{1
 use 'mhartington/formatter.nvim'
 use {
   'godlygeek/tabular',
   cmd = { 'Tab' },
 }

 -- language-server {{{1
 use 'neovim/nvim-lspconfig'

 -- completion {{{1
 use 'hrsh7th/nvim-compe'
 use 'windwp/nvim-autopairs' 

 -- additional compiler plugin {{{1
 use {
   'ingram1107/sass-compiler.vim',
   ft = 'scss',
 }

 -- nvim dev {{{1
 use 'tjdevries/nlua.nvim'

 -- dir and project {{{1
 use 'kyazdani42/nvim-web-devicons'
 use {
   'justinmk/vim-dirvish',
   key = { 'n', '<c-n>' },
 }
 use {
   'bounceme/remote-viewer',
   cmd = 'Dirvish'
 }
 use {
   'roginfarrer/vim-dirvish-dovish',
   ft = 'dirvish',
 }
 use {
   'kyazdani42/nvim-tree.lua',
   cmd = 'NvimTreeToggle',
 }
 use 'ingram1107/origin.nvim'
 use 'tpope/vim-projectionist'

 -- session management {{{1
 use 'ingram1107/souvenir.nvim'

 -- undo tree visualise {{{1
 use {
   'mbbill/undotree',
   cmd = { 'UndotreeToggle' },
 }

 -- finder {{{1
 use {
   'nvim-telescope/telescope.nvim',
   requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', },
 }
 use 'jremmen/vim-ripgrep'

 -- git {{{1
 use {
   'TimUntersberger/neogit',
   cmd = 'Neogit',
   config = function()
     require('neogit').setup{}
   end,
 }
 use {
   'lewis6991/gitsigns.nvim',
   requires = {
     'nvim-lua/plenary.nvim',
   },
   config = function()
     require('gitsigns').setup {
       signs = {
         add          = {hl = 'GitSignsAdd'   , text = '▏', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
         change       = {hl = 'GitSignsChange', text = '▏', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
         delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
         topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
         changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
       },
       keymaps = {
         noremap = true,
         buffer = true,
         ['n ]g'] = { expr = true, "&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
         ['n [g'] = { expr = true, "&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},
       },
     }
   end
 }

 -- repl {{{1
 use 'ingram1107/aedile.nvim'
 use {
   'jpalardy/vim-slime',
   ft = { 'lisp', 'python', },
 }
 use {
   'guns/vim-sexp',
   ft = { 'lisp', },
   config = function() vim.api.nvim_exec('packadd vim-sexp', false) end,
 }

 -- snippet support {{{1
 use 'SirVer/ultisnips'
 -- use 'L3MON4D3/LuaSnip'

 -- useful keybind {{{1
 use 'tpope/vim-commentary'
 use {
   'andymass/vim-matchup',
   config = function()
     vim.g.matchup_matchparen_offscreen = {}
   end,
 }
 use 'tpope/vim-surround'
 use 'tpope/vim-repeat'
 use {
   'mattn/emmet-vim',
   ft = {
     'html',
     'css',
   },
 }

 -- note plugin {{{1
 use {
   'vimwiki/vimwiki',
   cmd = 'VimwikiIndex',
   keys = { 'n', '<leader>ww' },
 }
 use 'ledger/vim-ledger'
 use {
   'kristijanhusak/orgmode.nvim',
   opt = true,
 }
 --[[
     TODO:
         test neorg plugin
           - littleclover 2021-07-12 04:48:44 PM +0800
 --]]
 use { 
   'vhyrro/neorg',
   requires = 'nvim-lua/plenary.nvim'
 }

 -- grammar check {{{1
 use { 
   'rhysd/vim-grammarous',
   ft = { 'markdown', 'text', 'tex', 'vimwiki', 'gitcommit', }
 }

 -- miscellaneous {{{1
 use {
   'norcalli/nvim-colorizer.lua',
   config = function() require('colorizer').setup() end,
 }
 use {
   'tpope/vim-eunuch',
   cmd = {
     'Delete',
     'Unlink',
     'Remove',
     'Rename',
     'Chmod',
     'Mkdir',
     'SudoEdit',
     'SudoWrite',
   },
 }
 use {
   'davidgranstrom/nvim-markdown-preview',
   ft = 'markdown'
 }
 -- }}}
end)
