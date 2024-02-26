-- packer conf
vim.cmd([[
packadd packer.nvim
packadd termdebug
]])

return require('packer').startup({
  function()
    -- load packer {{{1
    use('wbthomason/packer.nvim')

    -- performance {{{1
    use({
      'tweekmonster/startuptime.vim',
      cmd = { 'StartupTime' },
    })

    -- theme {{{1
    use('ingram1107/vim-zhi')

    -- statusline and tabline {{{1
    use('nvim-lualine/lualine.nvim')
    use({
      'j-hui/fidget.nvim',
      config = function()
        require('fidget').setup({
          notification = {
            window = {
              winblend = 50, -- makes it transparent
            },
          }
        })
      end,
    })

    -- visual improvement {{{1
    use({
      'luukvbaal/stabilize.nvim',
      config = function()
        require('stabilize').setup()
      end,
    })
    use({
      'https://gitlab.com/yorickpeterse/nvim-pqf',
      config = function()
        require('pqf').setup()
      end,
    })
    use({
      'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
      config = function()
        require('lsp_lines').setup()

        vim.diagnostic.config({
          virtual_text = false,
        })
      end,
    })

    -- syntax and debug {{{1
    use({
      'nvim-treesitter/nvim-treesitter',
      requires = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        'romgrk/nvim-treesitter-context',
        'nvim-treesitter/playground',
      },
      run = ':TSUpdate',
    })
    use ({
      'JoosepAlviste/nvim-ts-context-commentstring',
      config = function()
        vim.g.skip_ts_context_commentstring_module = true
      end
    })
    use({
      'romgrk/nvim-treesitter-context',
      config = function()
        require('treesitter-context').setup({
          max_lines = 3,
        })
      end,
    })
    use('dag/vim-fish')
    use({
      'lervag/vimtex',
      ft = 'tex',
    })

    -- format {{{1
    use('mhartington/formatter.nvim')
    use({
      'godlygeek/tabular',
      cmd = { 'Tab' },
    })

    -- language-server {{{1
    use('neovim/nvim-lspconfig')

    -- completion {{{1
    use({
      'hrsh7th/nvim-compe',
      opt = true,
    })
    use({
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'saadparwaiz1/cmp_luasnip',
        'PaterJason/cmp-conjure',
      },
    })
    use('onsails/lspkind-nvim')
    use('windwp/nvim-ts-autotag')

    -- compiler plugin {{{1
    use({
      'ingram1107/sass-compiler.vim',
      ft = 'scss',
    })
    use('tpope/vim-dispatch')

    -- nvim dev {{{1
    use('milisims/nvim-luaref')

    -- dir and project {{{1
    use('elihunter173/dirbuf.nvim')
    use({
      'nvim-tree/nvim-tree.lua',
      requires = 'nvim-tree/nvim-web-devicons',
      cmd = 'NvimTreeToggle',
      config = function()
        require('nvim-tree').setup({
          hijack_cursor = true,
          hijack_directories = {
            enable = false,
          },
          renderer = {
            highlight_git = true,
            highlight_opened_files = 'all',
          },
          diagnostics = {
            enable = true,
            show_on_dirs = true,
          },
          view = {
            width = 25,
          },
          filters = {
            custom = { '.git', 'node_modules' },
          },
        })
      end,
    })
    use('ingram1107/origin.nvim')
    use('tpope/vim-projectionist')

    -- session management {{{1
    use('~/Projects/souvenir.nvim')
    use('ThePrimeagen/harpoon')

    -- undo tree visualise {{{1
    use({
      'mbbill/undotree',
      cmd = { 'UndotreeToggle' },
    })

    -- finder {{{1
    use({
      'nvim-telescope/telescope.nvim',
      requires = 'nvim-lua/plenary.nvim',
    })
    use('jremmen/vim-ripgrep')

    -- git {{{1
    use({
      'TimUntersberger/neogit',
      config = function()
        require('neogit').setup({
          integrations = {
            diffview = true,
          },
        })
      end,
      requires = 'nvim-lua/plenary.nvim',
    })
    use({
      'sindrets/diffview.nvim',
      cmd = { 'Neogit', 'DiffviewOpen', 'DiffviewFileHistory' },
      requires = 'nvim-lua/plenary.nvim',
    })
    use('emmanueltouzery/agitator.nvim')
    use({
      'lewis6991/gitsigns.nvim',
      -- tag = 'release',
      requires = {
        'nvim-lua/plenary.nvim',
      },
      config = function()
        require('gitsigns').setup({
          signs = {
            add = { hl = 'GitSignsAdd', text = '▏', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
            change = { hl = 'GitSignsChange', text = '▏', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
            delete = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
            topdelete = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
            changedelete = {
              hl = 'GitSignsChange',
              text = '~',
              numhl = 'GitSignsChangeNr',
              linehl = 'GitSignsChangeLn',
            },
          },
          on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
              opts = opts or {}
              opts.buffer = bufnr
              vim.keymap.set(mode, l, r, opts)
            end

            map('n', ']c', function()
              if vim.wo.diff then
                return ']c'
              end
              vim.schedule(function()
                gs.next_hunk()
              end)
              return '<Ignore>'
            end, { expr = true })

            map('n', '[c', function()
              if vim.wo.diff then
                return '[c'
              end
              vim.schedule(function()
                gs.prev_hunk()
              end)
              return '<Ignore>'
            end, { expr = true })

            map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
            map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
            map('n', '<leader>hS', gs.stage_buffer)
            map('n', '<leader>hu', gs.undo_stage_hunk)
            map('n', '<leader>hR', gs.reset_buffer)
            map('n', '<leader>hp', gs.preview_hunk)
            map('n', '<leader>hb', function()
              gs.blame_line({ full = true })
            end)
            map('n', '<leader>tb', gs.toggle_current_line_blame)
            map('n', '<leader>hd', gs.diffthis)
            map('n', '<leader>hD', function()
              gs.diffthis('~')
            end)
            map('n', '<leader>td', gs.toggle_deleted)

            map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
          end,
        })
      end,
    })

    -- repl {{{1
    use('ingram1107/aedile.nvim')
    use({
      'jpalardy/vim-slime',
      ft = { 'python', 'lua' },
    })
    use({
      'Olical/conjure',
      requires = 'Olical/aniseed',
      config = function()
        vim.g['conjure#mapping#prefix'] = '\\'
        vim.g['conjure#filetype#fennel'] = 'conjure.client.fennel.stdio'
      end,
    })
    use({
      'eraserhd/parinfer-rust',
      cmd = 'ParinferOn',
      run = 'cargo build --release',
    })
    use({
      'guns/vim-sexp',
      ft = { 'clojure', 'scheme', 'lisp', 'timl', 'fennel' },
      config = function()
        vim.cmd('packadd vim-sexp')
      end,
    })
    use({
      'dccsillag/magma-nvim',
      run = ':UpdateRemotePlugins',
      cmd = 'MagmaInit',
    })
    use('goerz/jupytext.vim')
    use('rafcamlet/nvim-luapad')

    -- snippet support {{{1
    use({ 'SirVer/ultisnips', opt = true })
    use({
      'L3MON4D3/LuaSnip',
      tag = "v2.*",
      run = "make install_jsregexp"
    })

    -- useful keybind {{{1
    use({
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup({
          pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        })
      end,
    })
    use({
      'andymass/vim-matchup',
      config = function()
        vim.g.matchup_matchparen_offscreen = {}
      end,
    })
    use('tpope/vim-surround')
    use('tpope/vim-repeat')
    use({
      'mattn/emmet-vim',
      ft = {
        'html',
        'css',
        'php',
        'xml',
        'xslt',
      },
    })

    -- note plugin {{{1
    use('ledger/vim-ledger')
    use('mickael-menu/zk-nvim')
    use({
      'nvim-orgmode/orgmode',
      config = function()
        require('orgmode').setup({
          org_agenda_files = '~/Org/**/*',
          org_default_notes_files = '~/Documents/Notes/index.org',
        })
      end
    })
    use('jbyuki/nabla.nvim')

    -- miscellaneous {{{1
    use({
      'norcalli/nvim-colorizer.lua',
      config = function()
        require('colorizer').setup()
      end,
    })
    use({
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
    })
    use({
      'davidgranstrom/nvim-markdown-preview',
      cmd = 'MarkdownPreview',
    })
    use('seandewar/killersheep.nvim')
    use('alec-gibson/nvim-tetris')
    -- }}}
  end,
  config = {
    compile_path = vim.fn.stdpath('config') .. '/plugin/packer_compiled.lua',
  },
})
