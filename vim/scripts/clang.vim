
" Enables Autopep8 formatting with default mapping gq (visual mode)
au FileType python setlocal formatprg=autopep8\ -

" Sets global py config file and disables the confirm window on startup
let g:ycm_global_ycm_extra_conf = '~/configs/vim_scripts/global_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_binary_path = exepath("clangd")

" Highlight bad whitespaces as red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp,*.hpp,*.js,*.jsx,*.html,*.css match BadWhitespace /\s\+$/
highlight BadWhitespace ctermbg=red guibg=red
