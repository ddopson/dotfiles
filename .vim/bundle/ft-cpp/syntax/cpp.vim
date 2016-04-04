""
" @section Introduction, intro
" Syntax, indent, and core settings for the cpp filetype.

if exists('b:current_syntax')
  finish
endif

" Load base cpp syntax (also defines b:current_syntax).
source $VIMRUNTIME/syntax/cpp.vim

" Add syntax highlighting for google3 integral types defined in
" //base/integral_types.h
syntax keyword cType int8 int16 int32 int64 uint8 uint16 uint32 uint64
syntax keyword cType string
syntax keyword cType schar char32 uword_t

" Add syntax highlighting for google3 casts defined in //base/casts.h
syntax match cppCast "\<\(up\|down\)_cast\s*<"me=e-1
syntax match cppCast "\<\(up|down\)_cast\s*$"
