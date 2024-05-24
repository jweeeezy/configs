set nocompatible
syntax enable
filetype plugin indent on
colorscheme industry

" visuals
set termguicolors
set colorcolumn=80
set incsearch
set nohlsearch
set viminfo^=%
set numberwidth=6
set fillchars+=vert:\

" accessibility
set encoding=utf8
set mouse=a "enables some mouse support features
set splitbelow splitright
set noesckeys

" file saving
set noswapfile
set nobackup
set nowb

" indentation and formatting
set expandtab
set smarttab
set autoindent
set shiftwidth=4
set tabstop=4

" file finding
set path+=**
set wildmenu

" leader shortcuts
let mapleader = ","
nnoremap <leader>no :set nonumber norelativenumber<cr>
nnoremap <leader>nn :set number relativenumber<cr>
nnoremap <leader>pad :execute 'topleft' ((&columns - &textwidth) / 2 - 1) . 'vsplit _paddding_' <cr> | wincmd p

" ctrl shortcuts
nnoremap <c-h> :set hlsearch!<cr>

" command shortcuts
command! W write
command! Q quit
command! SS :mksession! ~/session.vim
command! F :find
command! SSO :source ~/session.vim
command! TT execute 'vert term' | execute 'vert term' | execute '1q'
