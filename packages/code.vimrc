" VIM Setup {{{

" Count lines of code {{{

function! LinesOfCode()
    echo system('cloc --quiet '.bufname("%"))
endfunction

"}}}

" FILETYPES  {{{ ==============================================================

" JSON {{{ -------------------------------------------------------------------

" autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.json set ft=json

augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

" }}}

" MARKDOWN {{{

" markdown filetype file
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown

" }}}

" R {{{

nnoremap <silent> <LocalLeader>gl :call RAction("dplyr::glimpse")<CR>
let vimrplugin_ca_ck=1

" }}}

" Syntastic {{{

nmap <silent><Leader>N :SyntasticCheck<CR>:Errors<CR>

" Symbols
let g:syntastic_enable_signs = 1
let g:syntastic_enable_highlighting=1
let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol  = '⚡'
let g:syntastic_style_warning_symbol  = '⚡'
" ✍ ✏︎ ✒︎ ✄ ✂︎ ☕︎ ✑ ☹ ⚡︎ ☞

" Checkers and styles
let g:syntastic_python_checkers = ['pylint', 'pep8', 'mccabe', 'pep257']
let g:syntastic_enable_r_lintr_checker = 1
let g:syntastic_r_checkers = 1
" let g:syntastic_r_checkers = ['lintr', 'svtools']
" let g:syntastic_enable_r_svtools_checker=1
" If speed is a problem, specify less intensive checking with the line below
" let g:syntastic_r_lint_styles = 'list(spacing.indentation.notabs, spacing.indentation.evenindent)'
let g:syntastic_tex_checkers = ['lacheck', 'chktex']

" Only check syntax on demand (passive)
" Python is passive to avoid conflicts with vim-pythonmode
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['tex', 'python', 'r', 'rmd', 'rmarkdown', 'rst', 'cpp'] }
" let g:syntastic_mode_map = { 'mode': 'active',
"             \ 'active_filetypes': ['r', 'rmd', 'rmarkdown', 'rst'],
"             \ 'passive_filetypes': ['tex', 'python'] }

" Recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" }}}

" Commentary {{{ -------------------------------------------------------------

nmap <Leader>c <Plug>CommentaryLine
xmap <Leader>c <Plug>Commentary

augroup plugin_commentary
    au!
    au FileType python setlocal commentstring=#%s
    au FileType htmldjango setlocal commentstring={#\ %s\ #}
    au FileType puppet setlocal commentstring=#\ %s
augroup END

" }}}

" Neocomplete {{{

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_refresh_always = 1
let g:neocomplete#max_list = 30
let g:neocomplete#min_keyword_length = 1
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#data_directory = $OH_MY_VIM.'/tmp/neocomplete'

" disable the auto select feature by default to speed up writing without
" obstacles (is optimal for certain situations)
let g:neocomplete#enable_auto_select = 0
                                        
" toggle the auto select feature
function! ToggleNeoComplete()
  if !g:neocomplete#disable_auto_complete && g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 0
      let g:neocomplete#enable_auto_select = 0
  elseif !g:neocomplete#disable_auto_complete && !g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 1
      let g:neocomplete#enable_auto_select = 0
  elseif g:neocomplete#disable_auto_complete && !g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 0
      let g:neocomplete#enable_auto_select = 1
  endif
endfunction

nnoremap <silent><Leader>ea :call ToggleNeoComplete()<CR>

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#sources#omni#functions')
  let g:neocomplete#sources#omni#functions = {}
endif

" Python
let g:neocomplete#sources#omni#input_patterns.python='[^. \t]\.\w*'
" R (plugin: vim-R-plugin)
" let g:neocomplcache_enable_force_overwrite_completefunc = 1
let g:neocomplete#sources#omni#input_patterns.r = '[[:alnum:].\\]\+'
let g:neocomplete#sources#omni#functions.r = 'rcomplete#CompleteR'
" Use Alt+- to create <- as in Rstudio
set <M-->=-
let vimrplugin_assign_map = "<M-->"


" }}}

" END Plugin Setup }}}

" Unite Menu {{{

let g:unite_source_menu_menus.code = {
    \ 'description' : '           coding
        \                                                ⌘ `c',
    \}
let g:unite_source_menu_menus.code.command_candidates = [
    \['▷ toggle auto-completion state (manual → disabled → auto)    ⌘ ,ea',
        \'call ToggleNeoComplete()'],
    \['▷ syntastic toggle                           (syntastic)',
        \'SyntasticToggleMode'],
    \['▷ syntastic check & errors                   (syntastic)     ⌘ ,N',
        \'normal ,N'],
    \['▷ count lines of code',
        \'Unite -default-action= output:call\\ LinesOfCode()'],
    \['▷ toggle indent lines                                        ⌘ ,L',
        \'IndentLinesToggle'],
    \]
nnoremap <silent>[menu]c :Unite -silent menu:code<CR>

" END Unite Menu }}}

