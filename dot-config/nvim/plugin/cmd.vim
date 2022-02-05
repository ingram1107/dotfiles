" custom commands
com! -nargs=1 T vsp | e term://$SHELL | call feedkeys("<args><cr>")
com! -nargs=0 PluginEdit e /home/clover/.config/nvim/plugin/plugins.lua
com! -nargs=0 ZkSetup lua require('zk').setup({picker="telescope"})
