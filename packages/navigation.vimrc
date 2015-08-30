" Plugin Setup {{{

" winresizer {{{

let g:winresizer_start_key = '<C-C><C-W>'
" cancelar pulsando ESC
" let g:winresizer_finish_with_escape = 1
let g:winresizer_keycode_finish = 27

" }}}

" zoomwintab {{{

map <Leader>z :ZoomWinTabToggle<CR>

" }}}

" END Plugin Setup }}}

" Unite Menu {{{
let g:unite_source_menu_menus.navigation = {
    \ 'description' : '     navigate by buffers, tabs & windows
        \                   ⌘ [space]b',
    \}
let g:unite_source_menu_menus.navigation.command_candidates = [
    \['▷ buffers                                                    ⌘ ,b',
        \'Unite buffer'],
    \['▷ tabs                                                       ⌘ ,B',
        \'Unite tab'],
    \['▷ windows',
        \'Unite window'],
    \['▷ location list',
        \'Unite location_list'],
    \['▷ quickfix',
        \'Unite quickfix'],
    \['▷ resize windows                                             ⌘ C-C C-W',
        \'WinResizerStartResize'],
    \['▷ new vertical window                                        ⌘ ,v',
        \'vsplit'],
    \['▷ new horizontal window                                      ⌘ ,h',
        \'split'],
    \['▷ close current window                                       ⌘ ,k',
        \'close'],
    \['▷ toggle quickfix window                                     ⌘ ,q',
        \'normal ,q'],
    \['▷ zoom                                                       ⌘ ,z',
        \'ZoomWinTabToggle'],
    \['▷ delete buffer                                              ⌘ ,K',
        \'bd'],
    \]
nnoremap <silent>[menu]b :Unite -silent menu:navigation<CR>

" END Unite Menu }}}
