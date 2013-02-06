" Vim syntax file
" Language: Jade
" Maintainer: Joshua Borton
" Credits: Tim Pope

syn case match

" @coffeeAll and @coffeeJS inherited from coffee.vim

syn region  javascriptParenthesisBlock start="(" end=")" contains=@coffeeJS contained keepend
syn cluster coffeeJS add=javascriptParenthesisBlock

syn region  ijadeJavascript matchgroup=ijadeJavascriptOutputChar start="[!&]\==\|\~" skip=",\s*$" end="$" contained contains=@coffeeJS keepend
syn region  ijadeJavascript matchgroup=ijadeJavascriptChar start="-" skip=",\s*$" end="$" contained contains=@coffeeJS keepend
syn cluster ijadeTop contains=ijadeBegin,ijadeComment,ijadeHtmlComment,ijadeJavascript
syn match   ijadeBegin "^\s*\%([<>]\|&[^=~ ]\)\@!" nextgroup=ijadeTag,ijadeClassChar,ijadeIdChar,ijadePlainChar,ijadeJavascript
syn match   ijadeTag "\w\+\%(:\w\+\)\=" contained contains=htmlTagName,htmlSpecialTagName nextgroup=@ijadeComponent
syn cluster ijadeComponent contains=ijadeAttributes,ijadeIdChar,ijadeBlockExpansionChar,ijadeClassChar,ijadePlainChar,ijadeJavascript
syn match   ijadeComment ' *\/\/.*$'
syn region  ijadeHtmlComment start="^\z(\s*\)/"  end="^\%(\z1 \| *$\)\@!"
syn region  ijadeAttributes matchgroup=ijadeAttributesDelimiter start="(" end=")" contained contains=@coffeeJS,ijadeHtmlArg,htmlArg,ijadeAttributeString,htmlEvent,htmlCssDefinition nextgroup=@ijadeComponent
syn match   ijadeClassChar "\." contained nextgroup=ijadeClass
syn match   ijadeBlockExpansionChar ":\s" contained nextgroup=ijadeTag
syn match   ijadeIdChar "#{\@!" contained nextgroup=ijadeId
syn match   ijadeClass "\%(\w\|-\)\+" contained nextgroup=@ijadeComponent
syn match   ijadeId "\%(\w\|-\)\+" contained nextgroup=@ijadeComponent
syn region  ijadeDocType start="^\s*!!!" end="$"
" Unless I'm mistaken, syntax/html.vim requires
" that the = sign be present for these matches.
" This adds the matches back for ijade.
syn keyword ijadeHtmlArg contained href title

syn match   ijadePlainChar "\\" contained
syn region  ijadeInterpolation matchgroup=ijadeInterpolationDelimiter start="#{" end="}" contains=@coffeeJS
syn match   ijadeInterpolationEscape "\\\@<!\%(\\\\\)*\\\%(\\\ze#{\|#\ze{\)"

syn region  ijadeAttributeString start=+\%(=\s*\)\@<='+ skip=+\%(\\\\\)*\\'+ end=+'+ contains=ijadeInterpolation
syn region  ijadeAttributeString start=+\%(:\s*\)\@<='+ skip=+\%(\\\\\)*\\'+ end=+'+ contains=ijadeInterpolation
syn region  ijadeAttributeString start=+\%(=\s*\)\@<="+ skip=+\%(\\\\\)*\\'+ end=+"+ contains=ijadeInterpolation
syn region  ijadeAttributeString start=+\%(:\s*\)\@<="+ skip=+\%(\\\\\)*\\'+ end=+"+ contains=ijadeInterpolation

syn region  ijadeJavascriptFilter matchgroup=ijadeFilter start="^\z(\s*\):javascript\s*$" end="^\%(\z1\s\|\s*$\)\@!" contains=@coffeeJS
syn region  ijadeCoffeescriptFilter matchgroup=ijadeFilter start="^\z(\s*\):coffeescript\s*$" end="^\%(\z1\s\|\s*$\)\@!" contains=@coffeeAll
syn region  ijadePlainFilter matchgroup=ijadeFilter start="^\z(\s*\):\%(markdown\|sass\|less\|cdata\)\s*$" end="^\%(\z1\s\|\s*$\)\@!"

syn region  ijadeScriptBlock matchgroup=ijadeScript start="^\z(\s*\)\%(if\|else\|unless\|while\|for\|each\|until\|block\|append\|mixin\|extends\|include\)" end="$" contains=ijadeAttributeString keepend

syn region  ijadeJavascriptBlock start="^\z(\s*\)script" nextgroup=@ijadeComponent,ijadeError end="^\%(\z1\s\|\s*$\)\@!" contains=@ijadeTop,@coffeeJS keepend
syn region  ijadeCssBlock        start="^\z(\s*\)style" nextgroup=@ijadeComponent,ijadeError  end="^\%(\z1\s\|\s*$\)\@!" contains=@ijadeTop,@htmlCss keepend

syn match  ijadeError "\$" contained

hi ijadeBegin ctermbg=black ctermfg=grey cterm=underline
hi def link ijadeTag                    Special
hi def link ijadeScript                 PreProc
hi def link ijadeExtend                 PreProc
hi def link ijadeHtmlArg                htmlArg
hi def link ijadeAttributeString        String
hi def link ijadeAttributesDelimiter    Identifier
hi def link ijadeIdChar                 Special
hi def link ijadeClassChar              Special
hi def link ijadeBlockExpansionChar     Special
hi def link ijadeId                     Identifier
hi def link ijadeClass                  Type
hi def link ijadeInterpolationDelimiter Delimiter
hi def link ijadeFilter                 PreProc
hi def link ijadeDocType                PreProc
hi def link ijadeComment                Comment
hi def link ijadeHtmlComment            ijadeComment

