set nocompatible

" ----- Pre Plugin Manager Setup ----

filetype off
filetype plugin indent off
set rtp+=~/.vim/bundle/Vundle.vim

" ----- Plugin Management ----

call vundle#begin('~/.vim/plugged')

    " Fuzzy Finder
    Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plugin 'junegunn/fzf.vim'

    " Ctrlsf Keyword Search
    Plugin 'dyng/ctrlsf.vim'

    " Nerdtree File System Explorer
    Plugin 'preservim/nerdtree'

    " Vim LSP
    Plugin 'prabirshrestha/vim-lsp'
    Plugin 'mattn/vim-lsp-settings'
    Plugin 'prabirshrestha/asyncomplete.vim'
    Plugin 'prabirshrestha/asyncomplete-lsp.vim'

    " GoYo Window Focus Tool (Zen Mode)
    Plugin 'junegunn/goyo.vim'

    " Editorconfig vim support
    Plugin 'editorconfig/editorconfig-vim'

    " File formatter
    Plugin 'tell-k/vim-autopep8'
    Plugin 'psf/black'
    Plugin 'prettier/vim-prettier'

    " Colorschemes
    Plugin 'liuchengxu/space-vim-dark'
    Plugin 'romainl/Apprentice'
    Plugin 'morhetz/gruvbox'
    Plugin 'whatyouhide/vim-gotham'
    Plugin 'cocopon/iceberg.vim'
    Plugin 'tomasr/molokai'
    Plugin 'ayu-theme/ayu-vim'
    Plugin 'aditya-azad/candle-grey'
    Plugin 'haishanh/night-owl.vim'
    Plugin 'sts10/vim-pink-moon'
    Plugin 'doki-theme/doki-theme-vim'

call vundle#end()

filetype plugin indent on

" ----- Global Settings ----

syntax enable

set autoindent
set backspace=indent,eol,start
set clipboard+=unamedplus
set colorcolumn=80
set cursorline
set encoding=utf8
set expandtab
set fillchars+=vert:\
set incsearch
set mouse=a
set nobackup
set noesckeys
set nohlsearch
set noswapfile
set nowb
set numberwidth=6
set path+=**
set scrolloff=8
set shiftwidth=4
set smarttab
set splitbelow
set splitright
set tabstop=4
set termguicolors
set viminfo^=%
set wildcharm=<C-n>
set wildmenu
set wildmode=full

" ----- Global Variables ----

let g:autopep8_max_line_length=119

let s:clip = '/mnt/c/Windows/System32/clip.exe'

let g:colors = getcompletion('', 'color')
let g:colorscheme_file = expand('~/.vim_last_colorscheme')

let g:ctrlsf_backend = 'ack'
let g:ctrlsf_default_root = 'cwd'
let g:ctrlsf_ignore_dir = [".venv", ".mypy_cache"]
let g:ctrlsf_case_sensitive = 'smart'
let g:ctrlsf_regex_pattern = 0
let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_populate_qflist = 1
let g:ctrlsf_auto_close = { "normal":0, "compact":0 }
let g:ctrlsf_auto_focus = { "at":"none" }
let g:ctrlsf_auto_preview = 0
let g:ctrlsf_winsize = '46'
let g:ctrlsf_position = 'right'

let g:fzf_action = {
      \ 'ctrl-e': 'edit',
      \ 'ctrl-s': 'vertical split',
      \ 'ctrl-i': 'split',
      \ }

let g:goyo_width  = 81
let g:goyo_height = 97
let g:goyo_linenr = 0

let g:lsp_diagnostics_highlights_insert_mode_enabled=0
let g:lsp_diagnostics_signs_insert_mode_enabled=0
let g:lsp_diagnostics_virtual_text_insert_mode_enabled=0
let g:lsp_settings = {
\   'pylsp-all': {
\     'workspace_config': {
\       'pylsp': {
\         'configurationSources': ['flake8']
\       }
\     }
\   },
\}

let g:navigation_state_index = 0
let g:navigation_states = ['Buffer', 'Location', 'Colorscheme', 'Quickfix']

let NERDTreeShowBookmarks = 0   
let NERDTreeShowHidden = 1      
let NERDTreeShowLineNumbers = 0 
let NERDTreeMinimalMenu = 1     
let NERDTreeWinPos = 'left'     
let NERDTreeWinSize = 31        

" ----- Global Functions ----

function! ColorschemeGetNext()
    let idx = index(g:colors, g:colors_name)
        return (idx + 1 >= len(g:colors) ? g:colors[0] : g:colors[idx + 1])
endfunction

function! ColorschemeGetPrevious()
    let idx = index(g:colors, g:colors_name)
        return (idx - 1 < 0 ? g:colors[-1] : g:colors[idx - 1])
endfunction

function! ColorschemeTweak()
    highlight String                  cterm=italic term=italic
    highlight Comment                 cterm=italic term=italic
    highlight Normal                  guibg=NONE
    highlight vertsplit               guibg=NONE guifg=NONE
    highlight signcolumn              guibg=NONE ctermbg=NONE
    highlight cursorline              cterm=underline guibg=NONE
    highlight colorcolumn             guibg=Grey23

    highlight LspWarningHighlight     cterm=underline guifg=yellow ctermul=yellow
    highlight LspWarningText          guibg=NONE guifg=yellow
    highlight LspWarningVirtualText   cterm=italic guibg=bg guifg=yellow
    highlight LspErrorVirtualText     cterm=italic guibg=bg guifg=red
    highlight LspErrorText            guibg=NONE guifg=red
    highlight LspErrorHighlight       cterm=underline guifg=red ctermul=red
    highlight LspHintHighlight        cterm=underline guifg=DeepPink1
    highlight LspHintText             guifg=NONE guifg=DeepPink1
    highlight LspHintVirtualText      cterm=italic guibg=bg guifg=DeepPink1
endfunction

function! QuickNavCycleState(direction)
    let g:navigation_state_index += a:direction
    if g:navigation_state_index >= len(g:navigation_states)
        let g:navigation_state_index = 0
    elseif g:navigation_state_index < 0
        let g:navigation_state_index = len(g:navigation_states) - 1
    endif
    :call s:quicknav_update_state()
endfunction


" ----- Script Private Functions -----

function! s:colorscheme_save_current()
    let l:current_colorscheme = g:colors_name
    call writefile([l:current_colorscheme], g:colorscheme_file)
endfunction

function!  s:lsp_init() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=auto
endfunction

function! s:quicknav_update_state()
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
        nnoremap <silent> <c-k> :execute "colorscheme " .. ColorschemeGetNext()<CR>
        nnoremap <silent> <c-j> :execute "colorscheme " .. ColorschemeGetPrevious()<CR>
    endif
endfunction

" ----- User Commands -----

" NOTE used for grep
" command! -nargs=+ -complete=file -bar Grep silent grep! -r <args> .

command! CloseAllBuffers :%bd|e#
command! SS :mksession! ~/.session.vim
command! SSO :source ~/.session.vim
command! W write
command! Q quit

" ----- Auto Commands Groups Triggers -----

" NOTE used for grep
" autocmd QuickFixCmdPost *grep* cwindow

augroup ColorSchemeTriggers
    autocmd!
    autocmd ColorScheme * call ColorschemeTweak()
    autocmd VimLeavePre * call s:colorscheme_save_current()
    autocmd User GoyoLeave nested call ColorschemeTweak()
augroup END

augroup CursorLineTriggers
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

augroup LSPTriggers
    autocmd!
    autocmd User lsp_buffer_enabled call s:lsp_init()
augroup END

" ----- Keyboard Mappings -----

let mapleader = " "

" Normal Mode
nnoremap <silent> <c-n>      :call QuickNavCycleState(1)<CR>
nnoremap <silent> <c-p>      :call QuickNavCycleState(-1)<CR>
nnoremap          <leader>no :set nonumber norelativenumber<cr>
vnoremap          <leader>y  "+y
nnoremap          <leader>nn :set number relativenumber<cr>
nnoremap          <leader>Y  gg"+yG
nnoremap          <c-q>      :NERDTreeToggle<CR>
nnoremap          <c-w>t     :vertical terminal<cr>
nnoremap          <c-e>      :!cat % \| less -R<cr>:redraw!<cr>
nnoremap          <c-f>      :Files<cr>
nnoremap          <c-g>      :CtrlSF<space>
nnoremap          <c-h>      :set hlsearch!<cr>
nnoremap          <c-j>      :bprev!<CR>
nnoremap          <c-k>      :bnext!<CR>
nnoremap          <c-l>      :LspDocumentDiagnostics<cr>
nnoremap          <c-b>      :buffer<space>
nnoremap          <c-m>      :marks<cr>

" Visual Mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" ----- Autostart Init -----

if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

if filereadable(g:colorscheme_file)
    let g:old_colorscheme = readfile(g:colorscheme_file)[0]
    execute "colorscheme " . g:old_colorscheme
endif