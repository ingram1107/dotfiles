" Compiler: Python
" Maintainer: Chirstoph Herzog <cf.herzog@gmx.net>
" Modified By: littleclover
" Last Change: 2020 Mar 06

if exists("curent_compiler")
    finish
endif

let current_compiler = "python"

CompilerSet makeprg=python
CompilerSet errorformat=
      \%A\ \ File\ \"%f\"\\\,\ line\ %l\\\,%m,
      \%C\ \ \ \ %.%#,
      \%+Z%.%#Error\:\ %.%#,
      \%A\ \ File\ \"%f\"\\\,\ line\ %l,
      \%+C\ \ %.%#,
      \%-C%p^,
      \%Z%m,
