"   Enables syntax highlighting
let g:user42 = 'jwillert'
let g:mail42 = '@student.42heilbronn.de'
syntax enable
command! SS :mksession! ~/session.vim
command! SSO :source ~/session.vim
set encoding=utf8
set nobackup
set nowb
set noswapfile
set viminfo^=%
" set expandtab
" set smarttab
set shiftwidth=4
set tabstop=4
"   Show current line number and relative numbers
set number
set relativenumber
"   On Split priotize splitting below or right
set splitbelow splitright
set fillchars+=vert:\ 
"   Unmap arrow keys for practice purposes
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
"   Set CTRL + H to highlights search results
set incsearch
set nohlsearch
nnoremap <c-h> :set hlsearch!<cr>

"   Set colors
    "   Status Colors
let color_active = "black"
let color_nonactive = "black"

    "   Font Colors
let color_font_nonactive =249
let color_font_active =123

"   Set a marker for 80 chars width
set colorcolumn=80
execute "hi ColorColumn ctermbg="123

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
