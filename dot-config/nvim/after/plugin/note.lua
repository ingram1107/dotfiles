-- neorg conf
require('neorg').setup({
  load = {
    ['core.defaults'] = {},
    ['core.keybinds'] = {
      config = {
        default_keybinds = true,
        neorg_leader = '<Leader>o',
      },
    },
    ['core.norg.completion'] = {
      config = {
        engine = 'nvim-cmp',
      },
    },
    ['core.norg.concealer'] = {},
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
      workspace = 'default',
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
    },
  },
})

require('neorg.callbacks').on_event('core.keybinds.events.enable_keybinds', function(_, keybinds)
  keybinds.map_event_to_mode('norg', {
    n = {
      { 'gtd', 'core.norg.qol.todo_items.todo.task_done' },
      { 'gtu', 'core.norg.qol.todo_items.todo.task_undone' },
      { 'gtp', 'core.norg.qol.todo_items.todo.task_pending' },
      { 'gtn', 'core.norg.qol.todo_items.todo.task_cycle' },
    },
  }, { silent = true, noremap = true })
end)
