-- packer conf
vim.cmd('packadd packer.nvim')
vim.cmd('packadd termdebug')

return require('packer').startup({
  function()
    -- load packer {{{1
    use { 'wbthomason/packer.nvim', opt = true }

    -- performance {{{1
    use 'lewis6991/impatient.nvim'
    use {
      'tweekmonster/startuptime.vim',
      cmd = { 'StartupTime', }
    }

    -- theme {{{1
    use '/mnt/Nemo/git/vim-monokai'
    use 'tanvirtin/monokai.nvim'

    -- statusline and tabline {{{1
    use 'nvim-lualine/lualine.nvim'
    use {
      'j-hui/fidget.nvim',
      config = function ()
        require('fidget').setup()
      end
    }

    -- syntax and debug {{{1
    use {
      'nvim-treesitter/nvim-treesitter',
      requires = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        'p00f/nvim-ts-rainbow',
        'romgrk/nvim-treesitter-context',
        'JoosepAlviste/nvim-ts-context-commentstring',
        'nvim-treesitter/playground',
      },
      run = ':TSUpdate',
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
    use {
      'hrsh7th/nvim-compe',
      opt = true,
    }
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'saadparwaiz1/cmp_luasnip',
        'PaterJason/cmp-conjure',
      },
    }
    use 'onsails/lspkind-nvim'
    use 'windwp/nvim-autopairs' 
    use 'windwp/nvim-ts-autotag'
    use 'abecodes/tabout.nvim'

    -- compiler plugin {{{1
    use {
      'ingram1107/sass-compiler.vim',
      ft = 'scss',
    }
    use 'tpope/vim-dispatch'

    -- nvim dev {{{1
    use 'tjdevries/nlua.nvim'
    use 'milisims/nvim-luaref'

    -- dir and project {{{1
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
      requires = 'kyazdani42/nvim-web-devicons',
      cmd = 'NvimTreeToggle',
      config = function()
        require('nvim-tree').setup {
          auto_close = true,
          hijack_cursor = true,

          diagnostic = {
            enable = true,
          },

          update_to_buf_dir = {
            enable = false,
          },

          view = {
            width = 25,
          },

          filters = {
            custom = { '.git', 'node_modules' },
          },
        }
      end,
    }
    use 'ingram1107/origin.nvim'
    use 'tpope/vim-projectionist'

    -- session management {{{1
    use 'ingram1107/souvenir.nvim'
    use 'ThePrimeagen/harpoon'

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
    use 'emmanueltouzery/agitator.nvim'
    use {
      'lewis6991/gitsigns.nvim',
      tag = 'release',
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
    use '/mnt/Nemo/git/aedile.nvim'
    use {
      'jpalardy/vim-slime',
      ft = { 'python', 'lua' },
    }
    use {
      'Olical/conjure',
      config = function()
        vim.g['conjure#mapping#prefix'] = '\\'
        vim.g['conjure#filetype#fennel'] = 'conjure.client.fennel.stdio'
      end,
    }
    use {
      'guns/vim-sexp',
      ft = { 'lisp', 'fennel' },
      config = function()
        vim.cmd('packadd vim-sexp')
        vim.g.sexp_filetypes = vim.g.sexp_filetypes .. 'fennel'
      end,
    }
    use {
      'tpope/vim-sexp-mappings-for-regular-people',
      ft = { 'lisp', 'fennel' },
      config = function() vim.cmd('packadd sexp-mappings-for-regular-people') end,
    }
    use {
      'dccsillag/magma-nvim',
      run = ':UpdateRemotePlugins',
      cmd = 'MagmaInit'
    }
    use 'goerz/jupytext.vim'

    -- snippet support {{{1
    use { 'SirVer/ultisnips', opt=true }
    use 'L3MON4D3/LuaSnip'

    -- useful keybind {{{1
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup({
          mappings = {
            extended = true,
          }
        })
      end
    }
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
    use 'ledger/vim-ledger'
    use {
      'nvim-neorg/neorg',
      requires = 'nvim-lua/plenary.nvim',
    }
    use 'mickael-menu/zk-nvim'

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
      cmd = 'MarkdownPreview'
    }
    -- }}}
  end,
  config = {
    compile_path = vim.fn.stdpath('config')..'/plugin/packer_compiled.lua'
  },
})
