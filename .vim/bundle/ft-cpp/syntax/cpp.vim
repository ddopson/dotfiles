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
syntax keyword cType string string_view
syntax keyword cType schar char32 uword_t unique_ptr shared_ptr vector vector32 array

" Add syntax highlighting for google3 casts defined in //base/casts.h
syntax keyword cppCast unique_cast unique_cast_unsafe up_cast down_cast make_unique make_shared

syntax keyword cPreCondit ValueOrDie CHECK_OK CHECK CHECK_LT CHECK_LE CHECK_EQ CHECK_GT CHECK_GE CHECK_NE


syntax keyword cppKeyword declval

" Section: clang-include-fixer. See http://clang.llvm.org/extra/include-fixer.html
"Normal mode - fixes entire file.
nnoremap <leader>cf :let g:clang_include_fixer_query_mode=0<cr>:pyf /usr/lib/clang-include-fixer/clang-include-fixer.py<cr>
"Query mode - fixes only the line under the cursor.
nnoremap <leader>qf :let g:clang_include_fixer_query_mode=1<cr>:pyf /usr/lib/clang-include-fixer/clang-include-fixer.py<cr>
