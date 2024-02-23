syntax enable

" execute "hi StatusLine cterm=NONE"
" execute "hi StatusLineNc cterm=NONE"
" execute "hi StatusLineTerm cterm=NONE"
" execute "hi StatusLineTermNC cterm=NONE"
" execute "hi ColorColumn ctermbg="123

set termguicolors
colorscheme lunaperche
execute "hi Search guibg=Yellow"
execute "hi Normal guibg=NONE ctermbg=NONE"
execute "hi EndOfBuffer ctermfg=NONE ctermbg=NONE"
set background=dark
set colorcolumn=80

set mouse=a "enables some mouse support features
set encoding=utf8
set nobackup
set nowb
set noswapfile
set viminfo^=%
set number
set relativenumber
set splitbelow splitright
set fillchars+=vert:\

set expandtab "when pressing TAB use spaces instead
set smarttab "combines with expandtab and uses context-specific indentation
set autoindent "combines with expandtab to use spaces
set shiftwidth=4
set tabstop=4

set incsearch
set nohlsearch
nnoremap <c-h> :set hlsearch!<cr>

nnoremap <c-w>v :vertical terminal<cr>
nnoremap <c-w>s :terminal<cr>

nnoremap <c-w>t :hi Normal guibg=NONE ctermbg=NONE<cr>
nnoremap <c-w>b :set background=dark<cr>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

let mapleader = ","

command! SS :mksession! ~/session.vim
command! SSO :source ~/session.vim
command! TT execute 'vert term' | execute 'vert term' | execute '1q'
