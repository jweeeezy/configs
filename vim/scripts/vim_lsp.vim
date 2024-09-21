set nocompatible
filetype off
filetype plugin indent off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin('~/.vim/plugged')

Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'preservim/nerdtree'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'tell-k/vim-autopep8'

Plugin 'editorconfig/editorconfig-vim'

call vundle#end()

filetype plugin indent on

"   Fuzzy Finder Plugin
nnoremap <c-q> :GFiles<cr>
nnoremap <c-p> :Files<cr>
let g:fzf_action = {
      \ 'ctrl-e': 'edit',
      \ 'ctrl-s': 'vertical split',
      \ 'ctrl-i': 'split',
      \ }

"   CTRLSF Plugin
let g:ctrlsf_default_view_mode = 'compact'
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
let g:ctrlsf_populate_qflist = 1
nmap <C-f> <Plug>CtrlSFPrompt

"   NERDTREE Plugin settings
let NERDTreeShowBookmarks = 0   " Show the bookmarks table
let NERDTreeShowHidden = 1      " Show hidden files
let NERDTreeShowLineNumbers = 0 " Hide line numbers
let NERDTreeMinimalMenu = 1     " Use the minimal menu (m)
let NERDTreeWinPos = 'left'     " Panel opens on the left side
let NERDTreeWinSize = 31        " Set panel width to 31 columns
nmap <c-n> :NERDTreeToggle<CR>

"   lsp
function!  s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_diagnostics_signs_insert_mode_enabled=0
nnoremap <c-q> :LspDocumentDiagnostics<cr>

let g:lsp_settings = {
\   'pylsp-all': {
\     'workspace_config': {
\       'pylsp': {
\         'configurationSources': ['flake8']
\       }
\     }
\   },
\}

let g:autopep8_max_line_length=119
