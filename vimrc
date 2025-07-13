syntax on
filetype on

set ttyfast
set number
"set relativenumber
set showmode
set showcmd
set showmatch
set ruler
set cursorline
set scrolloff=5
set incsearch
set history=1024

set undofile
set undodir=~/.cache/vim
set undolevels=10000
set undoreload=50000

nnoremap <Up> <nop>
inoremap <Up> <nop>
nnoremap <Left> <nop>
inoremap <Left> <nop>
nnoremap <Right> <nop>
inoremap <Right> <nop>
nnoremap <Down> <nop>
inoremap <Down> <nop>
"nnoremap hh <nop>
"inoremap hh <nop>
"nnoremap jj <nop>
"inoremap jj <nop>
"nnoremap kk <nop>
"inoremap kk <nop>
"nnoremap ll <nop>
"inoremap ll <nop>

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
