if exists("current_compiler")
  finish
endif

let current_compiler = 'javac'

CompilerSet makeprg=javac\ -Xlint
CompilerSet errorformat=
      \%W%f:%l:\ %tarning:\ %m,
      \%E%f:%l:\ %trror:\ %m,
      \%-Z%p^,
      \%-C%.%#,
      \%-G%.%#
