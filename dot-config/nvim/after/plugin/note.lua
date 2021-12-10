-- vimwiki conf
-- TODO: source out vimwiki notes
vim.api.nvim_exec([[
  let vimwiki_ext2syntax = {}
]], false)
vim.g.vimwiki_list = {
  {
    path = '/mnt/Nemo/Documents/vimwiki',
    path_html = '/mnt/Nemo/Documents/htmlnotes',
    template_path = '/mnt/Nemo/Documents/htmltemplates',
    template_ext = '.html',
    css_name = 'monokai.css',
    auto_tags = 1,
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
require('neorg').setup({
  load = {
    ['core.defaults'] = {},
    ['core.keybinds'] = {
      config = {
        default_keybinds = true,
        neorg_leader = '<Leader>o',
      },
    },
    ['core.norg.concealer'] = {},
    ['core.norg.dirman'] = {
      config = {
        workspaces = {
          default = '/mnt/Nemo/Documents/neorg',
        },
        autodetect = true,
      },
    },
    ['core.gtd.base'] = {
      workspace = "default",
      displayers = {
        projects = {
          show_completed_projects = true,
        }
      },
      syntax = {
          context = "#contexts",
          due = "#time.due",
          start = "#time.start",
          waiting = "#waiting.for"
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
