" Vim syntax file
" Language:		erbjs
" Maintainer:		Tim Pope <vimNOSPAM@tpope.org>
" Last Change:		2010 Apr 15
" URL:			http://vim-ruby.rubyforge.org
" Anon CVS:		See above site
" Release Coordinator:	Doug Kearns <dougkearns@gmail.com>

if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'erbjs'
endif

if !exists("g:erbjs_default_subtype")
  let g:erbjs_default_subtype = "text"
endif

if !exists("b:erbjs_subtype") && main_syntax == 'erbjs'
  let s:lines = getline(1)."\n".getline(2)."\n".getline(3)."\n".getline(4)."\n".getline(5)."\n".getline("$")
  let b:erbjs_subtype = matchstr(s:lines,'erbjs_subtype=\zs\w\+')
  if b:erbjs_subtype == ''
    let b:erbjs_subtype = matchstr(&filetype,'^erbjs\.\zs\w\+')
  endif
  if b:erbjs_subtype == ''
    let b:erbjs_subtype = matchstr(substitute(expand("%:t"),'\c\%(\.erb\|\.erbjs\|\.erubis\)\+$','',''),'\.\zs\w\+$')
  endif
  if b:erbjs_subtype == 'rhtml'
    let b:erbjs_subtype = 'html'
  elseif b:erbjs_subtype == 'rb'
    let b:erbjs_subtype = 'ruby'
  elseif b:erbjs_subtype == 'yml'
    let b:erbjs_subtype = 'yaml'
  elseif b:erbjs_subtype == 'js'
    let b:erbjs_subtype = 'javascript'
  elseif b:erbjs_subtype == 'txt'
    " Conventional; not a real file type
    let b:erbjs_subtype = 'text'
  elseif b:erbjs_subtype == ''
    let b:erbjs_subtype = g:erbjs_default_subtype
  endif
endif

if !exists("b:erbjs_nest_level")
  let b:erbjs_nest_level = strlen(substitute(substitute(substitute(expand("%:t"),'@','','g'),'\c\.\%(erbjs\|template\)\>','@','g'),'[^@]','','g'))
endif
if !b:erbjs_nest_level
  let b:erbjs_nest_level = 1
endif

if exists("b:erbjs_subtype") && b:erbjs_subtype != ''
  exe "runtime! syntax/".b:erbjs_subtype.".vim"
  unlet! b:current_syntax
endif
syn include @rubyTop syntax/ruby.vim

syn cluster erbjsRegions contains=erbjsOneLiner,erbjsBlock,erbjsExpression,erbjsComment

exe 'syn region  erbjsOneLiner   matchgroup=erbjsDelimiter start="^%\{1,'.b:erbjs_nest_level.'\}%\@!"    end="$"     contains=@rubyTop	     containedin=ALLBUT,@erbjsRegions keepend oneline'
exe 'syn region  erbjsBlock      matchgroup=erbjsDelimiter start="<%\{1,'.b:erbjs_nest_level.'\}%\@!-\=" end="[=-]\=%\@<!%\{1,'.b:erbjs_nest_level.'\}>" contains=@rubyTop  containedin=ALLBUT,@erbjsRegions keepend'
exe 'syn region  erbjsExpression matchgroup=erbjsDelimiter start="<%\{1,'.b:erbjs_nest_level.'\}=\{1,4}" end="[=-]\=%\@<!%\{1,'.b:erbjs_nest_level.'\}>" contains=@rubyTop  containedin=ALLBUT,@erbjsRegions keepend'
exe 'syn region  erbjsComment    matchgroup=erbjsDelimiter start="<%\{1,'.b:erbjs_nest_level.'\}"       end="%\@<!%\{1,'.b:erbjs_nest_level.'\}>" contains=rubyTodo,@Spell containedin=ALLBUT,@erbjsRegions keepend'

" Define the default highlighting.

hi def link erbjsDelimiter		PreProc
hi def link erbjsComment		Comment

let b:current_syntax = 'erbjs'

if main_syntax == 'erbjs'
  unlet main_syntax
endif

" vim: nowrap sw=2 sts=2 ts=8:
