set nocompatible
filetype off
filetype plugin indent off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin('~/.vim/plugged')
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'preservim/nerdtree'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'prettier/vim-prettier'
Plugin 'tell-k/vim-autopep8'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
call vundle#end()

set completeopt=menuone,longest

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"   NERDTREE Plugin settings
let NERDTreeShowBookmarks = 0   " Show the bookmarks table
let NERDTreeShowHidden = 1      " Show hidden files
let NERDTreeShowLineNumbers = 0 " Hide line numbers
let NERDTreeMinimalMenu = 1     " Use the minimal menu (m)
let NERDTreeWinPos = 'left'     " Panel opens on the left side
let NERDTreeWinSize = 31        " Set panel width to 31 columns
nmap <c-n> :NERDTreeToggle<CR>

"   CTRLSF Plugin
let g:ctrlsf_backend = 'ack'
let g:ctrlsf_auto_close = { "normal":0, "compact":0 }
let g:ctrlsf_auto_focus = { "at":"start" }
let g:ctrlsf_auto_preview = 0
let g:ctrlsf_case_sensitive = 'smart'
let g:ctrlsf_default_view = 'compact'
let g:ctrlsf_regex_pattern = 0
let g:ctrlsf_position = 'right'
let g:ctrlsf_winsize = '46'
let g:ctrlsf_default_root = 'cwd'
nmap <C-f> <Plug>CtrlSFPrompt

"   Fuzzy Finder Plugin
nnoremap <c-q> :GFiles<cr>
nnoremap <c-p> :Files<cr>
let g:fzf_action = {
      \ 'ctrl-e': 'vertical split',
      \ 'ctrl-x': 'split',
      \ }

syntax enable
filetype plugin indent on
colorscheme industry
set cursorline

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

" ctrl shortcuts
nnoremap <c-h> :set hlsearch!<cr>

" command shortcuts
command! W write
command! Q quit
command! SS :mksession! ~/session.vim
command! SSO :source ~/session.vim

colorscheme late_evening
highlight ALEVirtualTextError   guibg=Red guifg=white cterm=italic
highlight ALEVirtualTextWarning guifg=Yellow guibg=bg cterm=italic
highlight ALEWarning            guibg=Yellow guifg=Grey23 cterm=italic
highlight EndOfBuffer           guibg=bg guifg=bg
highlight colorcolumn           guibg=Grey23
highlight Constant              guifg=Gold
highlight Comment               guifg=Plum cterm=italic guibg=bg
highlight LineNr                guifg=Grey50 guibg=bg
highlight Pmenu                 guifg=MistyRose2 guibg=Grey23
highlight PmenuSel              guibg=black
highlight Search                guibg=Yellow
highlight SignColumn            guibg=Grey30
highlight Statement             guifg=#ff5f87
highlight StatusLine            guibg=bg guifg=white term=NONE cterm=NONE
highlight StatusLineNc          guibg=bg guifg=darkgray term=NONE cterm=NONE
highlight StatusLineTerm        guibg=bg guifg=bg
highlight StatusLineTermNC      guibg=bg guifg=bg
highlight String                guifg=Wheat2
highlight vertsplit             guibg=bg guifg=bg
highlight Visual                cterm=NONE guibg=Grey30
