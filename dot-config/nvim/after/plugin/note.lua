-- neorg conf
require('neorg').setup({
  load = {
    ['core.defaults'] = {},
    ['core.keybinds'] = {
      config = {
        default_keybinds = true,
      },
    },
    ['core.norg.completion'] = {
      config = {
        engine = 'nvim-cmp',
      },
    },
    ['core.norg.concealer'] = {},
    ['core.norg.esupports.metagen'] = {
      config = {
        type = 'auto',
      },
    },
    ['core.norg.dirman'] = {
      config = {
        workspaces = {
          notes = '/mnt/Nemo/Documents/neorg',
          diary = '/mnt/Nemo/Documents/diary',
        },
        autodetect = true,
        autochdir= true,
        index = 'index.norg',
        last_workspace = vim.fn.stdpath('cache')..'/neorg_last_workspace.txt'
      },
    },
    ['core.norg.journal'] = {
      config = {
        workspace = 'diary',
        journal_folder = nil,
        use_folders = true,
      }
    },
    ['core.gtd.base'] = {
      config = {
        workspace = 'notes',
        displayers = {
          projects = {
            show_completed_projects = true,
          },
        },
        syntax = {
          context = '#contexts',
          due = '#time.due',
          start = '#time.start',
          waiting = '#waiting.for',
        },
      }
    },
  },
})
