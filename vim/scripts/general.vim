syntax enable

" visuals
set backspace=indent,eol,start
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
set clipboard+=unamedplus "requires vim-gtk (+ xclipboard)
set scrolloff=8

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
command! -nargs=+ -complete=file -bar Grep silent grep! -r <args> .
autocmd QuickFixCmdPost *grep* cwindow

" leader shortcuts
let mapleader = " "
nnoremap <leader>no :set nonumber norelativenumber<cr>
vnoremap <leader>y "+y
nnoremap <leader>nn :set number relativenumber<cr>
nnoremap <leader>Y gg"+yG

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" ctrl shortcuts
nnoremap <c-h> :set hlsearch!<cr>
nnoremap <c-b> :buffer<space>
nnoremap <c-m> :marks<cr>
nnoremap <c-e> :!cat % \| less -R<cr>:redraw!<cr>

set wildcharm=<C-n>
nnoremap <c-w>t :vertical terminal<cr>

nnoremap <silent> <c-j> :bprev!<CR>
nnoremap <silent> <c-k> :bnext!<CR>

let g:navigation_state_index = 0
let g:navigation_states = ['Buffer', 'Location', 'Colorscheme', 'Quickfix']

function! NavigationState()
    if g:navigation_state_index >= 0 && g:navigation_state_index < len(g:navigation_states)
        let state_name = g:navigation_states[g:navigation_state_index]
        echo "Navigation State: " . state_name
        if state_name == 'Buffer'
            nnoremap <silent> <c-j> :bprev!<CR>
            nnoremap <silent> <c-k> :bnext!<CR>
        elseif state_name == 'Quickfix'
            nnoremap <silent> <c-j> :cprev!<CR>
            nnoremap <silent> <c-k> :cnext!<CR>
        elseif state_name == 'Location'
            nnoremap <silent> <c-j> :lprev!<CR>
            nnoremap <silent> <c-k> :lnext!<CR>
        elseif state_name == 'Colorscheme'
            nnoremap <silent> <c-k> :exe "colo " .. NextColors()<CR>
            nnoremap <silent> <c-j> :exe "colo " .. PrevColors()<CR>
        endif
    else
        echo "Invalid Navigation State"
        return
    endif
endfunction

function! CycleNavigationState(direction)
    let g:navigation_state_index += a:direction
    if g:navigation_state_index >= len(g:navigation_states)
        let g:navigation_state_index = 0
    elseif g:navigation_state_index < 0
        let g:navigation_state_index = len(g:navigation_states) - 1
    endif
    :call NavigationState()
endfunction

nnoremap <silent> <c-n> :call CycleNavigationState(1)<CR>
nnoremap <silent> <c-p> :call CycleNavigationState(-1)<CR>
" nnoremap <c-i> <C-Right>

" command shortcuts
command! W write
command! Q quit
command! SS :mksession! ~/session.vim
command! SSO :source ~/session.vim
command! CloseAllBuffers :%bd|e#

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
