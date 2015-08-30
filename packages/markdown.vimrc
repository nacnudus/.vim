" VIM Setup {{{

" END VIM SETUP }}}

" Plugin Setup {{{

" Vim-markdown-extra-preview {{{

map <LocalLeader>mp :Me<CR>
map <LocalLeader>mr :Mer<CR>

let g:VMEPextensions = ['extra', 'codehilite']
" This is for Mac only, need a program accept html file as parameter
let g:VMEPhtmlreader= 'open'

" }}}

" END Plugin Setup }}}

" Unite Menu {{{
let g:unite_source_menu_menus.markdown = {
    \ 'description' : '       preview markdown extra docs
        \                           ⌘ [space]k',
    \}
let g:unite_source_menu_menus.markdown.command_candidates = [
    \['▷ preview',
        \'Me'],
    \['▷ refresh',
        \'Mer'],
    \]
nnoremap <silent>[menu]k :Unite -silent menu:markdown<CR>

" END Unite Menu }}}
