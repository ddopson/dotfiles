" Vim syntax file
" Language: Jade
" Maintainer: Joshua Borton
" Credits: Tim Pope
" Filenames: *.ijc

syn case match

" @coffeeAll and @coffeeJS inherited from coffee.vim

syn region  javascriptParenthesisBlock start="(" end=")" contains=@coffeeAll contained keepend
syn cluster coffeeAll add=javascriptParenthesisBlock

syn region  ijcCoffeescript matchgroup=ijcCoffeescriptOutputChar start="[!&]\==\|\~" skip=",\s*$" end="$" contained contains=@coffeeAll keepend
syn region  ijcCoffeescript matchgroup=ijcCoffeescriptChar start="-" skip=",\s*$" end="$" contained contains=@coffeeAll keepend
syn cluster ijcTop contains=ijcBegin,ijcComment,ijcHtmlComment,ijcCoffeescript,ijcIndent
syn match   ijcBegin "^\s*\%([<>]\|&[^=~ ]\)\@!" nextgroup=ijcTag,ijcClassChar,ijcIdChar,ijcPlainChar,ijcCoffeescript
syn match   ijcTag "\w\+\%(:\w\+\)\=" contained contains=htmlTagName,htmlSpecialTagName nextgroup=@ijcComponent
syn cluster ijcComponent contains=ijcAttributes,ijcIdChar,ijcBlockExpansionChar,ijcClassChar,ijcPlainChar,ijcCoffeescript
syn match   ijcComment ' *\/\/.*$'
syn region  ijcHtmlComment start="^\z(\s*\)/"  end="^\%(\z1 \| *$\)\@!"
syn region  ijcAttributes matchgroup=ijcAttributesDelimiter start="(" end=")" contained contains=@coffeeAll,ijcHtmlArg,htmlArg,ijcAttributeString,htmlEvent,htmlCssDefinition nextgroup=@ijcComponent
syn match   ijcClassChar "\." contained nextgroup=ijcClass
syn match   ijcBlockExpansionChar ":\s" contained nextgroup=ijcTag
syn match   ijcIdChar "#{\@!" contained nextgroup=ijcId
syn match   ijcClass "\%(\w\|-\)\+" contained nextgroup=@ijcComponent
syn match   ijcId "\%(\w\|-\)\+" contained nextgroup=@ijcComponent
syn region  ijcDocType start="^\s*!!!" end="$"
" Unless I'm mistaken, syntax/html.vim requires
" that the = sign be present for these matches.
" This adds the matches back for ijc.
syn keyword ijcHtmlArg contained href title

syn match   ijcPlainChar "\\" contained
syn region  ijcInterpolation matchgroup=ijcInterpolationDelimiter start="#{" end="}" contains=@coffeeAll
syn match   ijcInterpolationEscape "\\\@<!\%(\\\\\)*\\\%(\\\ze#{\|#\ze{\)"

syn region  ijcAttributeString start=+\%(=\s*\)\@<='+ skip=+\%(\\\\\)*\\'+ end=+'+ contains=ijcInterpolation
syn region  ijcAttributeString start=+\%(:\s*\)\@<='+ skip=+\%(\\\\\)*\\'+ end=+'+ contains=ijcInterpolation
syn region  ijcAttributeString start=+\%(=\s*\)\@<="+ skip=+\%(\\\\\)*\\'+ end=+"+ contains=ijcInterpolation
syn region  ijcAttributeString start=+\%(:\s*\)\@<="+ skip=+\%(\\\\\)*\\'+ end=+"+ contains=ijcInterpolation

syn region  ijcJavascriptFilter matchgroup=ijcFilter start="^\z(\s*\):javascript\s*$" end="^\%(\z1\s\|\s*$\)\@!" contains=@coffeeJS
syn region  ijcCoffeescriptFilter matchgroup=ijcFilter start="^\z(\s*\):coffeescript\s*$" end="^\%(\z1\s\|\s*$\)\@!" contains=@coffeeAll
syn region  ijcPlainFilter matchgroup=ijcFilter start="^\z(\s*\):\%(markdown\|sass\|less\|cdata\)\s*$" end="^\%(\z1\s\|\s*$\)\@!"

syn region  ijcScriptBlock matchgroup=ijcScript start="^\z(\s*\)\%(if\|else\|unless\|while\|for\|each\|until\|block\|append\|mixin\|extends\|include\)" end="$" contains=ijcAttributeString keepend

syn region  ijcJavascriptBlock start="^\z(\s*\)script" nextgroup=@ijcComponent,ijcError end="^\%(\z1\s\|\s*$\)\@!" contains=@ijcTop,@coffeeJS keepend
syn region  ijcCssBlock        start="^\z(\s*\)style" nextgroup=@ijcComponent,ijcError  end="^\%(\z1\s\|\s*$\)\@!" contains=@ijcTop,@htmlCss keepend

syn match  ijcError "\$" contained




hi ijcBegin ctermbg=black ctermfg=blue cterm=underline
hi def link ijcTag                    Special
hi def link ijcScript                 PreProc
hi def link ijcExtend                 PreProc
hi def link ijcHtmlArg                htmlArg
hi def link ijcAttributeString        String
hi def link ijcAttributesDelimiter    Identifier
hi def link ijcIdChar                 Special
hi def link ijcClassChar              Special
hi def link ijcBlockExpansionChar     Special
hi def link ijcId                     Identifier
hi def link ijcClass                  Type
hi def link ijcInterpolationDelimiter Delimiter
hi def link ijcFilter                 PreProc
hi def link ijcDocType                PreProc
hi def link ijcComment                Comment
hi def link ijcHtmlComment            ijcComment

