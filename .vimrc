"   Enables syntax highlighting
syntax enable

" PLUGIN MANAGER
set nocompatible
filetype off
" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" Download plug-ins to the ~/.vim/plugged/ directory
call vundle#begin('~/.vim/plugged')
" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'h3xx/vim-late_evening'
Plugin 'jiangmiao/auto-pairs'
Plugin 'preservim/nerdtree'
Plugin 'preservim/tagbar'
Plugin 'dyng/ctrlsf.vim'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'derekwyatt/vim-protodef'
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()
filetype plugin indent on

"	Clang-Format Command Settings
function! FormatWithClangFormat()
  let l:formatprg_backup=&formatprg
  set formatprg=clang-format\ -style=file
  normal gggqG
  let &formatprg=l:formatprg_backup
endfunction
command! ClangFormat call FormatWithClangFormat()
"	Clang-Format Key Binding
nnoremap <C-e> :ClangFormat<CR>

"	YCM	Autocompletion Plugin
let g:ycm_filetype_whitelist = { 'cpp':1, 'h':2, 'hpp':3, 'c':4, 'cxx':5 }
" Close preview window after completing the insertion
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
" Max number of completion suggestions 
let g:ycm_max_num_candidates = 20
" Max number of identifier-based suggestion
let g:ycm_max_num_identifier_candidates = 10
" Enable completion menu
let g:ycm_auto_trigger = 1
nmap <silent> <C-q> <plug>(YCMHover)
nmap <silent> <C-a> <plug>(YCMHover)
let g:ycm_key_list_stop_completion = ['<C-w>']
"inoremap <C-m> <C-y>
highlight Pmenu ctermfg=255 ctermbg=237

"   PULLING PROTOTYPES Plugin
" Pull in prototypes
nmap <buffer> <silent> <leader> ,PP
" Pull in prototypes without namespace definition"
nmap <buffer> <silent> <leader> ,PN
"   AUTOPAIR Plugin
"   Set CTRL+P to toggle AutoPair Plugin
let g:AutoPairsShortcutToggle = '<C-P>'

"   FSWITCH Plugin
au! BufEnter *.cpp let b:fswitchdst = 'hpp,h'
au! BufEnter *.h let b:fswitchdst = 'cpp,c'
nmap <c-b> :vsplit <bar> :wincmd l <bar> :FSRight<CR>

"   NERDTREE Plugin settings
nmap <c-n> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks = 0   " Show the bookmarks table
let NERDTreeShowHidden = 1      " Show hidden files
let NERDTreeShowLineNumbers = 0 " Hide line numbers
let NERDTreeMinimalMenu = 1     " Use the minimal menu (m)
let NERDTreeWinPos = 'left'     " Panel opens on the left side
let NERDTreeWinSize = 31        " Set panel width to 31 columns

"   TAGBAR Plugin
"   Focus the panel when opening it
let g:tagbar_autofocus = 1
" Highlight the active tag
let g:tagbar_autoshowtag = 1
" Make panel vertical and place on the right
let g:tagbar_position = 'botright vertical'
" Mapping to open and close the panel
nnoremap <c-t> <nop>
nmap <c-t> :TagbarToggle<CR>

"   CTRLSF Plugin
" Use the ack tool as the backend
let g:ctrlsf_backend = 'ack'
" Auto close the results panel when opening a file
let g:ctrlsf_auto_close = { "normal":0, "compact":0 }
" Immediately switch focus to the search window
let g:ctrlsf_auto_focus = { "at":"start" }
" Don't open the preview window automatically
let g:ctrlsf_auto_preview = 0
" Use the smart case sensitivity search scheme
let g:ctrlsf_case_sensitive = 'smart'
" Normal mode, not compact mode
let g:ctrlsf_default_view = 'normal'
" Use absoulte search by default
let g:ctrlsf_regex_pattern = 0
" Position of the search window
let g:ctrlsf_position = 'right'
" Width or height of search window
let g:ctrlsf_winsize = '46'
" Search from the current working directory
let g:ctrlsf_default_root = 'cwd'
" (Ctrl+F) Open search prompt (Normal Mode)
nmap <C-f> <Plug>CtrlSFPrompt 
" (Ctrl-F + f) Open search prompt with selection (Visual Mode)
"xmap <C-F>f <Plug>CtrlSFVwordPath
" (Ctrl-F + F) Perform search with selection (Visual Mode)
"xmap <C-F>F <Plug>CtrlSFVwordExec
" (Ctrl-F + n) Open search prompt with current word (Normal Mode)
nmap <C-f>w <Plug>CtrlSFCwordPath
" (Ctrl-F + o )Open CtrlSF window (Normal Mode)
"nnoremap <C-F>o :CtrlSFOpen<CR>
" (Ctrl-F + t) Toggle CtrlSF window (Normal Mode)
nnoremap <C-f>t :CtrlSFToggle<CR>
" (Ctrl-F + t) Toggle CtrlSF window (Insert Mode)
"inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

"	Variables for 42 Header
let g:user42 = 'jwillert'
let g:mail42 = '@student.42heilbronn.de'

"	Commands for saving and opening a session
command! SS :mksession! ~/session.vim
command! SSO :source ~/session.vim

"   Unmap arrow keys for practice purposes
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"   Set CTRL + H to highlights search results
set incsearch
set nohlsearch
nnoremap <c-h> :set hlsearch!<cr>

"	General settings for vim
" set expandtab		" use spaces instead of tabbing
" set smarttab
set autoindent
set smartindent
set encoding=utf8
set nobackup
set nowb
set noswapfile
set viminfo^=%
set shiftwidth=4
set tabstop=4
set number
set relativenumber
set splitbelow splitright
set fillchars+=vert:\
set mouse=a
"set termwinsize=12x0

"	own Theme
"   Set colors
    "   Status Colors
set background=dark
let color_active = "black"
let color_nonactive = "black"

    "   Font Colors
let color_font_nonactive =249
let color_font_active =123

execute "hi VertSplit ctermfg=".color_nonactive
execute "hi VertSplit ctermbg=".color_nonactive
execute "hi StatusLine ctermfg=".color_font_active
execute "hi StatusLine ctermbg=".color_active 
execute "hi StatusLine cterm=NONE"
execute "hi StatusLineNC ctermfg=".color_font_nonactive
execute "hi StatusLineNC ctermbg=".color_nonactive
execute "hi StatusLineNc cterm=NONE"
execute "hi StatusLineTerm ctermfg=".color_font_active
execute "hi StatusLineTerm ctermbg=".color_active
execute "hi StatusLineTerm cterm=NONE"
execute "hi StatusLineTermNC ctermfg=".color_font_nonactive
execute "hi StatusLineTermNC ctermbg=".color_nonactive
execute "hi StatusLineTermNC cterm=NONE"
execute "hi LineNr ctermfg="123
execute "hi EndOfBuffer ctermfg=black ctermbg=black"

"   Set a marker for 80 chars width
set colorcolumn=80
execute "hi ColorColumn ctermbg="123


"	Own header
function! InsertHeader()
" Prompt the user
"let l:response = input("Insert header? (any key/n): ")

" Check response and return if 'n' is chosen
"if l:response ==# 'n'
	"return
"endif

call append(0, "// " . repeat("=", 74) . " //")
call append(1, "// " . repeat(" ", 30) . "42 | Heilbronn" . repeat(" ", 30) . " //")
call append(2, "// " . repeat("=", 74) . " //")
call append(3, "// " . repeat(" ", 74) . " //")
call append(4, "// name:  jakob willert (jwillert)" . repeat(" ", 43) . " //")
call append(5, "// mail:  jwillert@student.42heilbronn.de" . repeat(" ", 36) . " //")
call append(6, "// file:  " . repeat (" ", 67) . " //")
call append(7, "// " . repeat(" ", 74) . " //")
call append(8, "// " . repeat("-", 74) . " //")
call append(9, "")
call append(10, "")
call append(11, "")
call append(12, "")
call append(13, "")
call setline(15, "// " . repeat("-", 74) . " //")
execute "normal 11G"
endfunction

function! UpdateFileName()
  " Get the first line of the file
  let l:firstLine = getline(2)
  
  " Check if the first line matches the unique header line
	if match(l:firstLine, '42 | Heilbronn') != -1
		let l:filename = expand('%:t')
		call setline(7, "// file:  " . l:filename . repeat(" ", 68 - len(l:filename)) . "//")
  endif
endfunction

nnoremap <C-i> :call InsertHeader()<CR>
autocmd BufWritePre * call UpdateFileName()
