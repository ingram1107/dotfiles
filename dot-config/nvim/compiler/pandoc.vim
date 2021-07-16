if exists("current_compiler")
    finish
endif

CompilerSet makeprg=pandoc\ %\ --pdf-engine=xelatex\ -o\ %<.pdf\ -M\ mainfont="IBMPlexSans"
