" << PLUGIN MANAGER >>
set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin('~/.vim/plugged')

Plugin 'VundleVim/Vundle.vim'
Plugin 'rainglow/vim'

Plugin 'preservim/nerdtree'
Plugin 'preservim/tagbar'
Plugin 'dyng/ctrlsf.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

Plugin 'ycm-core/YouCompleteMe'
Plugin 'dense-analysis/ale'

Plugin 'tell-k/vim-autopep8'

Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'AndrewRadev/tagalong.vim'
Plugin 'prettier/vim-prettier'

call vundle#end()
filetype plugin indent on

"   NERDTREE Plugin settings
let NERDTreeShowBookmarks = 0   " Show the bookmarks table
let NERDTreeShowHidden = 1      " Show hidden files
let NERDTreeShowLineNumbers = 0 " Hide line numbers
let NERDTreeMinimalMenu = 1     " Use the minimal menu (m)
let NERDTreeWinPos = 'left'     " Panel opens on the left side
let NERDTreeWinSize = 31        " Set panel width to 31 columns
nmap <c-n> :NERDTreeToggle<CR>

"   TAGBAR Plugin
let g:tagbar_autofocus = 1 " Focus the panel when opening it
let g:tagbar_autoshowtag = 1 " Highlight the active tag
let g:tagbar_position = 'botright vertical' " Make panel vertical and right
nnoremap <c-t> <nop>
nmap <c-t> :TagbarToggle<CR>

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
nmap <C-f>w <Plug>CtrlSFCwordPath

"   Fuzzy Finder Plugin
nnoremap <c-q> :GFiles<cr>

"   YouCompleteMe Plugin
" Set filetypes where YCM will be turned on
let g:ycm_filetype_whitelist = { 'cpp':1, 'h':2, 'hpp':3, 'c':4, 'cxx':5 , 'py':6, 'python':7, 'html':8, 'css':9, 'js':10, 'jsx':11}

let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_detailed_diagnostics = '<C-x>'
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_auto_hover = ''
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '!'
nnoremap '<c-e>' <nop>
nnoremap <C-x> <plug>(YCMHover)
map <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>

"   ALE Plugin
nnoremap <C-l> :ALEToggle<CR>
" let g:ale_enabled = 0
let g:ale_linters = {
  \   'javascript': ['eslint'],
  \}

"   Prettier vim Plugin
nnoremap <c-p> :Prettier<cr>
