" theme tweak

" hi TreesitterContext guibg=#3c3d37
" hi GitSignsAdd guifg=#a6e221 guibg=NONE
" hi GitSignsDelete guifg=#f92672 guibg=NONE
" hi GitSignsChange guifg=#e6db74 guibg=NONE
" hi LualineLspError guifg=#f92672 guibg=#3c3d37
" hi LualineLspWarning guifg=#fd971f guibg=#3c3d37
" hi VimwikiHeader1 guifg=#f92672 gui=bold
" hi VimwikiHeader2 guifg=#e6db74 gui=bold
" hi VimwikiHeader3 guifg=#a6e221 gui=bold
" hi VimwikiHeader4 guifg=#66d9ef gui=bold
" hi VimwikiHeader5 guifg=#2ea6e2 gui=bold
" hi VimwikiHeader6 guifg=#ae81ff gui=bold

com! -nargs=1 T vsp | e term://$SHELL | call feedkeys("<args><cr>")
com! -nargs=0 PluginEdit e /home/clover/.config/nvim/plugin/plugins.lua
com! -nargs=0 ZkSetup lua require('zk').setup({picker="telescope"})
