" Vim indent file
" Language: Mnml
" Maintainer: Emil Loer <emil@koffietijd.net>
" Last Change: 2011 Oct 29

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal autoindent sw=2 et
setlocal indentexpr=GetMnmlIndent()

" Only define the function once.
if exists("*GetMnmlIndent")
  finish
endif

let s:heredoc = '^\s*\w\+\s\+\%(\w\+=\%(\w*\|".*"\)\s\+\)*->\s*'

function! GetMnmlIndent()
  let lnum = prevnonblank(v:lnum-1)
  let line = substitute(getline(lnum),'\s\+$','','')
  let cline = substitute(substitute(getline(v:lnum),'\s\+$','',''),'^\s\+','','')
  let lastcol = strlen(line)
  let line = substitute(line,'^\s\+','','')
  let indent = indent(lnum)
  let cindent = indent(v:lnum)

  if line =~ s:heredoc
    return indent + &sw
  else
    return -1
  endif
endfunction
