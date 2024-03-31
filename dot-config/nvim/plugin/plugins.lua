-- lazy conf
require('lazy').setup{
  -- theme {{{1
  'ingram1107/vim-zhi',

  -- statusline and tabline {{{1
  'nvim-lualine/lualine.nvim',

  {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup({
        notification = {
          window = {
            winblend = 50,
          },
        },
      })
    end,
  },

  -- visual improvement {{{1
  {
    'luukvbaal/stabilize.nvim',
    config = function()
      require('stabilize').setup()
    end,
  },

  {
    'https://gitlab.com/yorickpeterse/nvim-pqf',
    config = function()
      require('pqf').setup()
    end,
  },

  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function()
      require('lsp_lines').setup()

      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  },

  -- syntax and debug {{{1
  {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'romgrk/nvim-treesitter-context',
    },
    run = ':TSUpdate',
  },

  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
  },

  {
    'romgrk/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup({
        max_lines = 3,
      })
    end,
  },

  'dag/vim-fish',

  { 'lervag/vimtex', ft = 'tex' },

  -- format {{{1
  'mhartington/formatter.nvim',
  { 'godlygeek/tabular', cmd = 'Tab' },

  -- language-server {{{1
  'neovim/nvim-lspconfig',

  -- completion {{{1
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'saadparwaiz1/cmp_luasnip',
      'PaterJason/cmp-conjure',
    },
  },

  'onsails/lspkind-nvim',
  'windwp/nvim-ts-autotag',

  -- compiler plugin {{{1
  'ingram1107/sass-compiler.vim',
  'tpope/vim-dispatch',

  -- nvim dev {{{1
  'milisims/nvim-luaref',

  -- dir and project {{{1
  'elihunter173/dirbuf.nvim',

  {
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
  },

  'ingram1107/origin.nvim',
  'tpope/vim-projectionist',

  -- session management {{{1
  'ingram1107/souvenir.nvim',
  'ThePrimeagen/harpoon',

  -- undo tree visualise {{{1
  { 'mbbill/undotree', cmd = 'UndotreeToggle' },

  -- finder {{{1
  { 'nvim-telescope/telescope.nvim', dependencies = 'nvim-lua/plenary.nvim' },
  'jremmen/vim-ripgrep',

  -- git {{{1
  {
    'TimUntersberger/neogit',
    config = function()
      require('neogit').setup({
        integrations = {
          diffview = true,
        },
      })
    end,
  },

  {
    'sindrets/diffview.nvim',
    cmd = {
      'Neogit',
      'DiffviewOpen',
      'DiffviewFileHistory',
    },
    dependencies = 'nvim-lua/plenary.nvim',
  },

  'emmanueltouzery/agitator.nvim',

  {
    'lewis6991/gitsigns.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
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
  },

  -- repl {{{1
  'ingram1107/aedile.nvim',
  'jpalardy/vim-slime',

  {
    'Olical/conjure',
    dependencies = 'Olical/aniseed',
    config = function()
      vim.g['conjure#mapping#prefix'] = '\\'
      vim.g['conjure#filetype#fennel'] = 'conjure.client.fennel.stdio'
    end,
  },

  { 'eraserhd/parinfer-rust', cmd = 'ParinferOn', build = 'cargo build --release' },

  'guns/vim-sexp',

  { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins', cmd = 'MagmaInit' },

  'goerz/jupytext.vim',
  'rafcamlet/nvim-luapad',

  -- snippet support {{{1
  {
    'L3MON4D3/LuaSnip',
    tag = 'v2.2.0',
    build = 'make install_jsregexp',
    config = function()
      require('luasnip.loaders.from_lua').load({ paths = '~/.config/nvim/luasnippets/' })
    end,
  },

  -- useful keybind {{{1
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end,
  },

  {
    'andymass/vim-matchup',
    config = function()
      vim.g.matchup_matchparen_offscreen = {}
    end,
  },

  'tpope/vim-surround',
  'tpope/vim-repeat',
  'mattn/emmet-vim',

  -- note plugin {{{1
  'ledger/vim-ledger',
  'mickael-menu/zk-nvim',

  {
    'nvim-orgmode/orgmode',
    config = function()
      require('orgmode').setup_ts_grammar()
      require('orgmode').setup({
        org_agenda_files = '~/Org/**/*',
        org_default_notes_files = '~/Documents/Notes/index.org',
      })
    end,
  },

  'jbyuki/nabla.nvim',

  -- miscellaneous {{{1
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },

  {
    'tpope/vim-eunuch',
    cmd  = {
      'Delete',
      'Unlink',
      'Remove',
      'Rename',
      'Chmod',
      'Mkdir',
      'SudoEdit',
      'SudoWrite',
    },
  },

  { 'davidgranstrom/nvim-markdown-preview', cmd = 'MarkdownPreview' },
  'seandewar/killersheep.nvim',
  'alec-gibson/nvim-tetris',

  -- }}}
}
