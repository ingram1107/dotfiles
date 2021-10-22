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
require('neorg').setup {
  load = {
    ['core.defaults'] = {},
    ['core.keybinds'] = {
      config = {
        default_keybinds = true,
        neorg_leader = "<Leader>o",
      }
    },
    ['core.norg.concealer'] = {},
    ['core.norg.dirman'] = {
      config = {
        workspaces = {
          default = '/mnt/Nemo/Documents/neorg'
        }
      }
    }
  }
}
