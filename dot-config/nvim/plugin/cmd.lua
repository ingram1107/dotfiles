-- custom commands
vim.api.nvim_create_user_command('T', 'vsp | e term://$SHELL | call feedkeys("<args><cr>")', { nargs = 1 })
vim.api.nvim_create_user_command('PluginEdit', 'e /home/clover/.config/nvim/plugin/plugins.lua', { nargs = 0 })
vim.api.nvim_create_user_command('ZkSetup', function()
  require('zk').setup({ picker = 'telescope' })
end, { nargs = 0 })
