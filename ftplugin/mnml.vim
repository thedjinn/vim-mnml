" Vim filetype plugin
" Language: Mnml
" Maintainer: Emil Loer <emil@koffietijd.net>
" Last Change: 2011 Oct 29

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let b:undo_ftplugin = "setl cms<"

setlocal commentstring=#\ %s

" vim:set sw=2:
