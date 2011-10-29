" Vim syntax file
" Language: mnml
" Maintainer: Emil Loer <emil@koffietijd.net>
" Version:  1
" Last Change:  2011 Oct 29

" Quit when a syntax file is already loaded.
if exists("b:current_syntax")
  finish
endif

syn match mnmlText /^.*$/ contains=mnmlLine
syn match mnmlLine "^\s*" nextgroup=mnmlTag contained
syn match mnmlTag /\l\w*/ contained nextgroup=mnmlArglist,mnmlHeredocstart skipwhite

syn match mnmlArglist /\%(\S\+=\%(\S*\|".*"\)\)\@=/ contained nextgroup=mnmlArgname
syn match mnmlArgname /\w\+/ contained nextgroup=mnmlArgsep
syn match mnmlArgsep /=/ contained nextgroup=mnmlArgvalue
syn match mnmlArgvalue /\S*/ contained nextgroup=mnmlArglist,mnmlHeredocstart skipwhite
syn region mnmlArgvalue start=+"+ skip=+\\\\\|\\"+ end=+"+ contained oneline nextgroup=mnmlArglist,mnmlHeredocstart skipwhite

syn keyword mnmlTodo contained TODO FIXME XXX
syn match mnmlComment /^\(\s*\)[#].*\(\n\1\s.*\)*/ contains=mnmlTodo

syn match mnmlHeredocstart /->\s*$/ contained
syn region mnmlHeredoc start=/\%(^\s*\w\+\s\+\%(\w\+=\%(\w*\|".*"\)\s\+\)*->\s*\n\)\@<=\z(\s\+\)/ end=/^\z1\@!/

hi def link mnmlComment Comment
hi def link mnmlTodo Todo

hi def link mnmlTag Keyword
hi def link mnmlText String

hi def link mnmlArgname Identifier
hi def link mnmlArgsep Normal
hi def link mnmlArgvalue Normal

hi def link mnmlHeredocstart Operator
hi def link mnmlHeredoc String

let b:current_syntax = "mnml"
