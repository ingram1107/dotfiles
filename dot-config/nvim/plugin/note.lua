-- vimwiki conf
vim.g.vimwiki_list = {
  {
    path = '/mnt/Nemo/Documents/vimwiki',
    path_html = '/mnt/Nemo/Documents/htmlnotes',
    template_path = '/mnt/Nemo/Documents/htmltemplates',
    template_ext = '.html',
    css_name = 'monokai.css',
    auto_tags = 1,
  },
  {
    path = '/mnt/Nemo/Documents/notes',
    syntax = 'markdown',
    ext = '.md',
  },
}
vim.g.vimwiki_key_mappings = {
  mouse = 1,
  table_mappings = 1,
}
vim.g.vimwiki_folding = 'expr'
vim.g.vimwiki_conceal_pre = 1
vim.g.vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,code'

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
