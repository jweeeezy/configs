
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin('~/.vim/plugged')

Plugin 'mattn/emmet-vim'
Plugin 'AndrewRadev/tagalong.vim'
Plugin 'tpope/vim-surround'

call vundle#end()
filetype plugin indent on

"   emmet Plugin settings
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-z>'

"   tagalong Plugin settings
let g:tagalong_verbose = 1
