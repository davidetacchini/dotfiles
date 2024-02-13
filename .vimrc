syntax on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set nohlsearch
set backspace=indent,eol,start
set splitright
set nowrap
set updatetime=50

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <C-d> <C-d>zz nnoremap <C-u> <C-u>zz
nnoremap J mzJ`z

highligh Comment ctermfg=green
autocmd FileType vue,html,yaml,json,css,scss,sass setlocal ts=2 sw=2

