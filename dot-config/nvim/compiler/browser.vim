if exists("current_compiler")
  finish
endif

let current_compiler = $BROWSER
CompilerSet makeprg=$BROWSER\ %
CompilerSet errorformat=
