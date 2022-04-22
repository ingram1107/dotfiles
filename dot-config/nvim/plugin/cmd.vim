" custom commands
com! -nargs=1 T vsp | e term://$SHELL | call feedkeys("<args><cr>")
com! -nargs=0 PluginEdit e /home/clover/.config/nvim/plugin/plugins.lua
com! -nargs=0 ZkSetup lua require('zk').setup({picker="telescope"})

" custom augroups
aug NvimTreeAutoClose
  au!
  " Auto quit the tab/vim if the last window is nvim-tree
  au BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
aug END
