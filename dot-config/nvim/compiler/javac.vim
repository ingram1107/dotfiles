if exists("current_compiler")
  finish
endif

let current_compiler = 'javac'

CompilerSet makeprg=javac\ %
CompilerSet errorformat=
      \%E%f:%l:\ %m,
      \%-Z%p^,
      \%-C%.%#,
      \%-G%.%#
