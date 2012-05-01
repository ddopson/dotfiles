" Vim compiler file
" Language:		erb-js
" Maintainer:		Doug Kearns <dougkearns@gmail.com>
" Last Change:		2008 Aug 1
" URL:			http://vim-ruby.rubyforge.org
" Anon CVS:		See above site
" Release Coordinator:	Doug Kearns <dougkearns@gmail.com>

if exists("current_compiler")
  finish
endif
let current_compiler = "erbjs"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

if exists("erbjs_compiler") && erbjs_compiler == "erbjs"
  CompilerSet makeprg=erbjs
else
  CompilerSet makeprg=erb
endif

CompilerSet errorformat=
    \erbjs:\ %f:%l:%m,
    \%+E%f:%l:\ parse\ error,
    \%W%f:%l:\ warning:\ %m,
    \%E%f:%l:in\ %*[^:]:\ %m,
    \%E%f:%l:\ %m,
    \%-C%\tfrom\ %f:%l:in\ %.%#,
    \%-Z%\tfrom\ %f:%l,
    \%-Z%p^,
    \%-G%.%#

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: nowrap sw=2 sts=2 ts=8:
