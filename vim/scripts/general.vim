syntax enable
colorscheme industry

" visuals
set termguicolors
set colorcolumn=80
set cursorline
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
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
set wildmode=full
set wildcharm=<C-n>
nnoremap <c-b> :b<space>

" leader shortcuts
let mapleader = ","
nnoremap <leader>no :set nonumber norelativenumber<cr>
nnoremap <leader>nn :set number relativenumber<cr>

" ctrl shortcuts
nnoremap <c-h> :set hlsearch!<cr>

" command shortcuts
command! W write
command! Q quit
command! SS :mksession! ~/session.vim
command! SSO :source ~/session.vim
