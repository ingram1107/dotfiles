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
          notes = os.getenv('HOME') .. '/Documents/Notes',
          diary = os.getenv('HOME') .. '/Diaries',
        },
        autodetect = true,
        autochdir = true,
        index = 'index.norg',
        last_workspace = vim.fn.stdpath('cache') .. '/neorg_last_workspace.txt',
      },
    },
    ['core.norg.journal'] = {
      config = {
        workspace = 'diary',
        journal_folder = nil,
        use_folders = true,
      },
    },
  },
})
