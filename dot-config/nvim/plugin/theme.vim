" theme tweak

hi TreesitterContext guibg=#3c3d37
hi GitSignsAdd guifg=#a6e221 guibg=NONE
hi GitSignsDelete guifg=#f92672 guibg=NONE
hi GitSignsChange guifg=#e6db74 guibg=NONE

" TODO:
"   export to lua
"     - littleclover 2021-07-12 11:16:42 PM +0800
function g:MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  return s
endfunction

function g:MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return '[' . bufname(buflist[winnr - 1]) . ']'
endfunction

set tabline=%!MyTabLine()
