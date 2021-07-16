if exists("current_compiler")
  finish
endif

let current_compiler="dot"
CompilerSet makeprg=dot\ -Tpng\ %\ -o\ %:r\.png
" CompilerSet errorformat=
"       \%E:\ %f:\ %m\ %l\
