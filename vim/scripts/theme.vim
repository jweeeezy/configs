let g:colorschemes = ['apprentice', 'elflord', 'industry', 'koehler', 'lunaperche', 'late_evening', 'slate']
let g:colorscheme_index = 0

function! CycleColorscheme(direction)
    let g:colorscheme_index += a:direction
    if g:colorscheme_index >= len(g:colorschemes)
        let g:colorscheme_index = 0
    elseif g:colorscheme_index < 0
        let g:colorscheme_index = len(g:colorschemes) - 1
    endif
    execute 'colorscheme' g:colorschemes[g:colorscheme_index]
    call s:tweak_colors()
endfunction

function! s:tweak_colors()
"    highlight EndOfBuffer             guibg=bg guifg=bg
"    highlight Constant                guifg=Gold
"    highlight Comment                 guifg=Plum cterm=italic guibg=bg
"    highlight LineNr                  guifg=Grey50 guibg=bg
"    highlight Pmenu                   guifg=MistyRose2 guibg=Grey23
"    highlight PmenuSel                guibg=black
"    highlight Search                  guibg=Yellow
"    highlight SignColumn              guibg=Grey30
"    highlight Statement               guifg=#ff5f87
"    highlight StatusLine              guibg=bg guifg=white term=NONE cterm=NONE
"    highlight StatusLineNc            guibg=bg guifg=darkgray term=NONE cterm=NONE
"    highlight StatusLineTerm          guibg=bg guifg=bg
"    highlight StatusLineTermNC        guibg=bg guifg=bg
"    highlight Visual                  cterm=NONE guibg=Grey30
"    highlight String                  guifg=Wheat2
    highlight colorcolumn             guibg=Grey23
    highlight vertsplit               guibg=bg guifg=bg
    highlight cursorline              cterm=underline guibg=black
    highlight LspWarningHighlight     cterm=underline guifg=yellow ctermul=yellow
    highlight LspWarningText          guibg=yellow guifg=black
    highlight LspWarningVirtualText   cterm=italic guibg=bg guifg=yellow
    highlight LspErrorVirtualText     cterm=italic guibg=bg guifg=red
    highlight LspErrorText            guibg=red guifg=black
    highlight LspErrorHighlight       cterm=underline guifg=red ctermul=red
    highlight LspHintHighlight        cterm=underline guifg=DeepPink1
    highlight LspHintText             guifg=black guibg=DeepPink1
    highlight LspHintVirtualText      cterm=italic guibg=bg guifg=DeepPink1
endfunction

:call CycleColorscheme(0)
