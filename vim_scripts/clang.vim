
" Set filetypes where YCM will be turned on
let g:ycm_filetype_whitelist = { 'cpp':1, 'h':2, 'hpp':3, 'c':4, 'cxx':5 , 'py':6, 'python':7 }

" Sets global py config file and disables the confirm window on startup
let g:ycm_global_ycm_extra_conf = '~/configs/vim_scripts/global_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_binary_path = exepath("clangd")

" Mappings to close the completion menu and invoke it
let g:ycm_key_list_stop_completion = '<C-Space>'
let g:ycm_key_invoke_completion = '<C-Space>'

let g:ycm_key_detailed_diagnostics = '<C-f>'
nmap <C-x> <plug>(YCMHover)

let g:ycm_auto_hover = ''
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1

" Mapping to look up the definition or declaration of the word under the cursor
map <C-x> :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Highlight bad whitespaces as red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp,*.hpp match BadWhitespace /\s\+$/
highlight BadWhitespace ctermbg=red guibg=red

let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '!'
