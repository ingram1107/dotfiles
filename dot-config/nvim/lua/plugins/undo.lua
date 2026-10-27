return {
  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    config = function()
      -- undotree conf
      vim.g.undotree_SetFocusWhenToggle = 1
      vim.g.undotree_TreeNodeShape = '⚫'
      vim.g.undotree_ShortIndicators = 1
      vim.g.undotree_HelpLine = 0
    end,
    keys = {
      {
        '<leader>u',
        '<cmd>UndotreeToggle<cr>',
      },
    },
  },
}
