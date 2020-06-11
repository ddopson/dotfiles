""
" @section Introduction, intro
" Syntax, indent, and core settings for the cpp filetype.

if exists('b:current_syntax')
  finish
endif

" Load base cpp syntax (also defines b:current_syntax).
source $VIMRUNTIME/syntax/cpp.vim

syntax keyword cppKeyword declval

" Add syntax highlighting for google3 integral types defined in
" //base/integral_types.h
syntax keyword cType int8 int16 int32 int64 uint8 uint16 uint32 uint64
syntax keyword cType string string_view
syntax keyword cType schar char32 uword_t unique_ptr shared_ptr vector vector32 array

" Add syntax highlighting for google3 casts defined in //base/casts.h
syntax keyword cppCast unique_cast unique_cast_unsafe up_cast down_cast make_unique make_shared

" Purple.
syntax keyword cPreCondit ValueOrDie CHECK_OK CHECK CHECK_LT CHECK_LE CHECK_EQ CHECK_GT CHECK_GE CHECK_NE
syntax keyword cPreCondit ValueOrDie QCHECK_OK QCHECK QCHECK_LT QCHECK_LE QCHECK_EQ QCHECK_GT QCHECK_GE QCHECK_NE
syntax keyword cPreCondit ValueOrDie ASSERT_OK ASSERT ASSERT_LT ASSERT_LE ASSERT_EQ ASSERT_GT ASSERT_GE ASSERT_NE


syntax keyword cppAttribute1 inline SCAM_INLINE SCAM_SIMD_INLINE SCAM_SSE4_INLINE SCAM_AVX1_INLINE SCAM_AVX2_INLINE SCAM_AVX512_INLINE
syntax keyword cppAttribute1 inline SCAM_SIMD_INLINE_LAMBDA SCAM_SSE4_INLINE_LAMBDA SCAM_AVX1_INLINE_LAMBDA SCAM_AVX2_INLINE_LAMBDA SCAM_AVX512_INLINE_LAMBDA
syntax keyword cppAttribute2 SCAM_OUTLINE SCAM_SIMD_OUTLINE SCAM_SSE4_OUTLINE SCAM_AVX1_OUTLINE SCAM_AVX2_OUTLINE SCAM_AVX512_OUTLINE


hi cppAttribute1 term=underline ctermfg=5 guifg=Purple
hi cppAttribute2 term=underline cterm=underline ctermfg=5 gui=underline guifg=SlateBlue


" Section: clang-include-fixer. See http://clang.llvm.org/extra/include-fixer.html
"Normal mode - fixes entire file.
nnoremap <leader>cf :let g:clang_include_fixer_query_mode=0<cr>:pyf /usr/lib/clang-include-fixer/clang-include-fixer.py<cr>
"Query mode - fixes only the line under the cursor.
nnoremap <leader>qf :let g:clang_include_fixer_query_mode=1<cr>:pyf /usr/lib/clang-include-fixer/clang-include-fixer.py<cr>
