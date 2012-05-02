
set fileencodings=utf-8,latin1
set encoding=utf-8
set nocompatible          " Use Vim defaults (much better!)
set bs=indent,eol,start   " allow backspacing over everything in insert mode

" Enable Line Numbers (left-hand side)
set number

" Auto-Indenting + pastemode (sorta works)
set autoindent            " always set autoindenting on


"map <F2> :set noautoindent<CR>i
"imap <F2> <ESC>:set noautoindent<CR>i
"map <F3> <ESC>:set autoindent<CR>
"imap <F3> <ESC>:set autoindent<CR>

map ` :set nonumber<CR>:set paste<CR>i
au InsertLeave * set nopaste 
au InsertLeave * set number
set showmode

" Highlight under the cursor
"autocmd CursorMoved * exe printf('match IncSearch /\<%s\>/', expand('<cword>'))


"set backup               " keep a backup file
set viminfo='20,\"5000    " read/write a .viminfo file, don't store more than 50 lines of registers
set history=500           " keep 50 lines of command line history

" Show Matches as you type in search
set incsearch

" Status bar (bottom) shows line filename and number
set ruler
set title
set ls=1

" When opening a file, jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif


" Highlight matches for the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" More gental scrolling with Shift-up/down
map <S-Up> 10k10<C-Y>zz
imap <S-Up> <ESC>10k10<C-Y>zzi
map <S-Down> 10j10<C-E>zz
imap <S-Down> <ESC>10j10<C-E>zzi
map <C-Up> <C-u>M
map <C-Down> <C-d>M



" Tabs = two spaces
set tabstop=13 softtabstop=2 shiftwidth=2 expandtab
syntax match Tab /\t/
hi Tab gui=underline guifg=blue ctermbg=blue

" F2 = Tabs, F3 = 2spaces, F4 = 13wide-Tabs
map <F2> <ESC>:set tabstop=5 softtabstop=5 shiftwidth=5 noexpandtab <CR>
imap <F2> <ESC>:set tabstop=5 softtabstop=5 shiftwidth=5 noexpandtab <CR>i
map <F3> <ESC>:set tabstop=13 softtabstop=2 shiftwidth=2 expandtab <CR>
imap <F3> <ESC>:set tabstop=13 softtabstop=2 shiftwidth=2 expandtab <CR>i
map <F4> <ESC>:set tabstop=13 softtabstop=13 shiftwidth=13 noexpandtab <CR>
imap <F4> <ESC>:set tabstop=13 softtabstop=13 shiftwidth=13 noexpandtab <CR>i

" Default to Tab mode for Makefile and *.php
augroup module
  autocmd BufRead,BufNewFile *.php set tabstop=5 softtabstop=5 shiftwidth=5 noexpandtab
  autocmd BufRead,BufNewFile Makefile set tabstop=5 softtabstop=5 shiftwidth=5 noexpandtab
augroup END





" Still not entirely clear what this crap does...
if has("cscope") && filereadable("/usr/bin/cscope")
  set csprg=/usr/bin/cscope
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
    " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
  set csverb
endif


" Syntax Highlighting - no this isn't, wtf is this again?
if &term=="xterm"
  set t_Co=8
  set t_Sb=^[[4%dm
  set t_Sf=^[[3%dm
endif




" Pathogen for managing other vim plugins
call pathogen#infect()
