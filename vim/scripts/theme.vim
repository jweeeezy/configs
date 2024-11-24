let g:colors = getcompletion('', 'color')
let g:colorscheme_file = expand('~/.vim_last_colorscheme')

function! TweakColors()
    " TODO put reused colors into a variable
    " special strings (italic)
    " background
    " error colors

    highlight String                  cterm=italic term=italic
    highlight Comment                 cterm=italic term=italic
    highlight Normal                  guibg=NONE
    highlight vertsplit               guibg=NONE guifg=NONE
    highlight signcolumn              guibg=NONE ctermbg=NONE
    highlight cursorline              cterm=underline guibg=NONE
    highlight colorcolumn             guibg=Grey23

    " Lsp specific Settings
    highlight LspWarningHighlight     cterm=underline guifg=yellow ctermul=yellow
    highlight LspWarningText          guibg=NONE guifg=Yellow
    highlight LspWarningVirtualText   cterm=italic guibg=bg guifg=yellow
    highlight LspErrorVirtualText     cterm=italic guibg=bg guifg=red
    highlight LspErrorText            guibg=NONE guifg=red
    highlight LspErrorHighlight       cterm=underline guifg=red ctermul=red
    highlight LspHintHighlight        cterm=underline guifg=DeepPink1
    highlight LspHintText             guifg=NONE guifg=DeepPink1
    highlight LspHintVirtualText      cterm=italic guibg=bg guifg=DeepPink1
endfunction

function! NextColors()
    let idx = index(g:colors, g:colors_name)
        return (idx + 1 >= len(g:colors) ? g:colors[0] : g:colors[idx + 1])
endfunction

function! PrevColors()
    let idx = index(g:colors, g:colors_name)
        return (idx - 1 < 0 ? g:colors[-1] : g:colors[idx - 1])
endfunction

function! SaveColorscheme()
    let l:current_colorscheme = g:colors_name
    call writefile([l:current_colorscheme], g:colorscheme_file)
endfunction

if filereadable(g:colorscheme_file)
    let g:old_colorscheme = readfile(g:colorscheme_file)[0]
    exe "colorscheme " . g:old_colorscheme
endif

autocmd VimLeavePre * call SaveColorscheme()
autocmd ColorScheme * call TweakColors()
autocmd! User GoyoLeave nested call TweakColors()
