syntax enable

set termguicolors
colorscheme late_evening
set colorcolumn=80
highlight colorcolumn       guibg=Grey23
highlight EndOfBuffer       guibg=bg guifg=bg
highlight LineNr            guifg=Grey50 guibg=bg
highlight StatusLine        guibg=bg guifg=white term=NONE cterm=NONE
highlight StatusLineNc      guibg=bg guifg=darkgray term=NONE cterm=NONE
highlight StatusLineTerm    guibg=bg guifg=bg
highlight StatusLineTermNC  guibg=bg guifg=bg
highlight vertsplit         guibg=bg guifg=bg
highlight Search            guibg=Yellow
highlight Pmenu             guifg=MistyRose2 guibg=Grey23
highlight PmenuSel          guibg=black
highlight Constant          guifg=Gold
highlight Statement         guifg=#ff5f87
highlight Visual            cterm=NONE guibg=Grey30
highlight Comment           guifg=Wheat1

set mouse=a "enables some mouse support features
set encoding=utf8
set nobackup
set nowb
set noswapfile
set viminfo^=%
set numberwidth=6
set splitbelow splitright
set fillchars+=vert:\

set expandtab "when pressing TAB use spaces instead
set smarttab "combines with expandtab and uses context-specific indentation
set autoindent "combines with expandtab to use spaces
set shiftwidth=4
set tabstop=4

set incsearch
set nohlsearch

let mapleader = ","

nnoremap <leader>no :set nonumber norelativenumber<cr>
nnoremap <leader>nn :set number relativenumber<cr>
nnoremap <leader>arr :windo wincmd = <cr>
nnoremap <leader>pad :execute 'topleft' ((&columns - &textwidth) / 2 - 1) . 'vsplit _paddding_' <cr> | wincmd p

nnoremap <c-h> :set hlsearch!<cr>

nnoremap <c-w>gs :vertical terminal<cr>
nnoremap <c-w>gi :terminal<cr>

nnoremap <c-w>t :hi Normal guibg=NONE ctermbg=NONE<cr>
noremap <c-w>b :set background=dark<cr>

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

command! RELOAD :source ~/.vimrc
command! SS :mksession! ~/session.vim
command! SSO :source ~/session.vim
command! TT execute 'vert term' | execute 'vert term' | execute '1q'
