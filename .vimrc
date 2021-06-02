"" Encode
set mouse=a
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast
set nocompatible

"" Backspace Indent
set backspace=indent,eol,start

"" Hidden
set hidden

set hlsearch
set number
" set relativenumber
set linebreak
set ruler
set showmatch
set showcmd
set shiftwidth=4
set tabstop=4
set textwidth=100
set smarttab
set expandtab
" set nonu
set binary
set noeol
syntax on

"" Idk
set modeline

" speed up syntax highlighting
set nocursorcolumn
set nocursorline

set wrap
set textwidth=80
set formatoptions=qrn1

" yaml
filetype plugin indent on

"Get the 2-space YAML as the default when hit carriage return after the colon
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

set is hlsearch ai ic scs
nnoremap <esc><esc> :nohls<cr>