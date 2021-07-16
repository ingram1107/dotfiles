let s:raquo='»'

function fold#simple_fold() abort
  let l:lines='[' . (v:foldend - v:foldstart + 1) . ']'
  let l:first=substitute(getline(v:foldstart), '\v *', '', '')
  return l:first . ' ' . l:lines . ' ' . s:raquo
endfunction
