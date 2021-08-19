-- neorg conf
local neorg_leader = "<leader>o"
local neorg_callbacks = require('neorg.callbacks')

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)

  keybinds.map_event_to_mode("norg", {
    n = {
      { "gld", "core.norg.qol.todo_items.todo.task_done" },
      { "glu", "core.norg.qol.todo_items.todo.task_undone" },
      { "glp", "core.norg.qol.todo_items.todo.task_pending" },
      { "gln", "core.norg.qol.todo_items.todo.task_cycle" }
    },
  }, { silent = true, noremap = true })

end)

require('neorg').setup {
  load = {
    ['core.defaults'] = {},
    ['core.norg.concealer'] = {},
    ['core.norg.dirman'] = {
      config = {
        workspaces = {
          my_workspace = '/mnt/Nemo/Documents/neorg'
        }
      }
    }
  }
}
