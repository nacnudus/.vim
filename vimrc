"                                             _
"                      _ __   __ _  _____   _(_)_ __ ___
"                     | '_ \ / _` |/ __\ \ / / | '_ ` _ \
"                     | | | | (_| | (__ \ V /| | | | | | |
"                     |_| |_|\__,_|\___| \_/ |_|_| |_| |_|
"
"
" Author: Duncan Garmonsway <duncan.garmonsway@gmail.com>
" Source: https://github.com/nacnudus/nacvim
" Based on: https://github.com/liangxianzhe/oh-my-vim by Xianzhe Liang

" Setup language {{{ ==========================================================

language en_NZ.UTF-8           " Solve some plugins incompatibilities

" }}}

" Load external configuration before anything else {{{ ========================

let s:before_nacvim_vimrc = expand('~/.before.vimrc')
if filereadable(s:before_nacvim_vimrc)
  exec ':so ' . s:before_nacvim_vimrc
endif

" }}}

set nocompatible             " No to total compatibility with ancient vi

" VIM-PLUG {{{ ===============================================================

" vim-plug auto-installation and setup {{{

" auto installing vim-plug
let vimplug_file=expand($NACVIM."/autoload/plug.vim")
if !filereadable(vimplug_file)
  echo "installing vim-plug..."
  echo ""
  execute "silent !mkdir -p ".$NACVIM."/autoload"
  execute "silent !curl -flo ".$NACVIM."/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
endif

" }}}

" PLUGINS (administrated by vim-plug) {{{

" Required:
call plug#begin(expand($NACVIM.'/plugged'))

" My plugins here: (all have to appear in the same vimrc, it seems)

" Unite and sources for it
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " dependency of some of Shougo's plugins
" Plug 'Shougo/vimproc.vim', { 'do': 'make -f make_mac.mak' } " for mac
Plug 'Shougo/unite.vim' " keyboard and search-driven menus
Plug 'Shougo/vimshell.vim' " shell
Plug 'Shougo/vimfiler.vim', {'on': 'VimFiler'} " file browser
Plug 'itchyny/unite-preview', {'on': 'VimFiler'} " preview for vimfiler
Plug 'Shougo/unite-outline' " navigate by headings in markdown, python, etc. (not R yet)
Plug 'tsukkee/unite-help' " help
Plug 'ujihisa/unite-colorscheme' " colourscheme with auto-preview
Plug 'ujihisa/unite-locate' " another way to find files
" Plug 'thinca/vim-unite-history' " doesn't work
Plug 'osyo-manga/unite-filetype' " change the file type
Plug 'osyo-manga/unite-quickfix'
Plug 'osyo-manga/unite-fold'
Plug 'tacroe/unite-mark' " navigate to marks
Plug 'tsukkee/unite-tag'
Plug 'Shougo/neomru.vim'  " most-recently used files

" Autocompletion
Plug 'Shougo/neocomplete.vim' " autocompletion
Plug 'Shougo/neosnippet.vim' " snippets infrastructure
Plug 'Shougo/neosnippet-snippets' " snippets themselves

" Spelling
Plug 'vim-scripts/LanguageTool' " grammar checking 

" Syntax
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'scrooloose/syntastic' " syntax checking

" Git
" Plug 'tpope/vim-fugitive' " Git
Plug 'jreybert/vimagit' " Git, better than fugitive
Plug 'airblade/vim-gitgutter' " symbol margin for fugitive
Plug 'gregsexton/gitv', {'on': 'Gitv'} " Git viewer
Plug 'joedicastro/vim-github-dashboard' " Browse GitHub events in Vim

" R
Plug 'jalvesaq/R-Vim-runtime', { 'for': ['r', 'rhelp', 'rmd', 'rrst',
      \ 'rbrowser', 'rdoc', 'rout', 'rmarkdown', 'rnoweb'] } " Must come before Vim-R-plugin
Plug 'jcfaria/Vim-R-plugin', { 'for': ['r', 'rhelp', 'rmd', 'rrst',
      \ 'rbrowser', 'rdoc', 'rout', 'rmarkdown', 'rnoweb'] } " The actual R plugin
let g:rplugin_pdfviewer = "zathura"
" insert mode keybindings in rmd are removed in ftplugin/rmd.vim because they're
" a pain when typing comment.

" LaTeX
" Plug 'coot/atp_vim' " Automatic TeX Plugin (uses latex-box under the hood)
Plug 'lervag/vimtex', { 'for': ['tex',  'bib', 'bst'] }
let g:vimtex_view_method='zathura'

" Python
Plug 'Yggdroot/indentLine', {'for': 'python'} " Show indent lines
Plug 'alfredodeza/coveragepy.vim', {'for': 'python'} " Show reports from coverage.py
Plug 'ivanov/vim-ipython', {'for': 'python'} " Show reports from coverage.py
Plug 'jmcantrell/vim-virtualenv' " virtual environments
Plug 'klen/python-mode', {'for': 'python'} " A Python plugin

" Lilypond
Plug 'gisraptor/vim-lilypond-integrator', { 'for': 'lilypond' } " lilypond syntax
                                         " <F4> save & make & play midi
                                         " <F5> save & make dvi, midi, ps
                                         " <F6> view ps
                                         " <S-F6> view dvi
                                         " <F7> prev error
                                         " <F8> next error
                                         " <F9> make
                                         " <F10> menu (ordinary vim menu)
                                         " <F12> comment region
                                         " <S-F12> uncomment region
                                         "

" Other filetypes
Plug 'chrisbra/csv.vim'                  " csv filetype plugin
Plug 'godlygeek/tabular' " dependency of plasticboy/vim-markdown
Plug 'othree/html5.vim', {'for': ['html', 'xhttml', 'css']} " hmtl
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' } " depends on godlygeek/tabular
Plug 'waylan/vim-markdown-extra-preview', { 'for': 'markdown' } " preview markdown " No python3 support
Plug 'tmux-plugins/vim-tmux' " tmux config syntax


" Productivity
Plug 'PeterRincker/vim-argumentative' " move by and sway function arguments
Plug 'Rykka/easydigraph.vim' " convert digraphs to graphs
Plug 'Rykka/easydigraph.vim' " smart digraphs insertion
Plug 'Shougo/junkfile.vim' " scratch files with types
Plug 'christoomey/vim-sort-motion' " sort text by motion
Plug 'christoomey/vim-tmux-navigator' " Consistent movement between vim and tmux panes
Plug 'dahu/vim-fanfingtastic'            " search mutliple lines
Plug 'delimitMate.vim' " Autocompletion of (, [, {, ', ...
Plug 'jimsei/winresizer' " easy window resizing
Plug 'joedicastro/DirDiff.vim', { 'on': 'DirDiff'} " diff directories
Plug 'kshenoy/vim-signature' " toggle, display and navigate marks
Plug 'salsifis/vim-transpose', { 'on': 'Transpose'} " transpose lines and text blocks
Plug 'sjl/gundo.vim', { 'on' : 'GundoToggle'} " browse the undo tree
" let g:gundo_prefer_python3=1 " Otherwise gundo complains about lack of python2.4+ support
Plug 'tpope/vim-characterize' " reveals all the character info, Unicode included
Plug 'tpope/vim-commentary' " toggle comments
Plug 'tpope/vim-repeat' " extend repetitions by the 'dot' key
Plug 'tpope/vim-speeddating' " Smart and fast date changer
Plug 'tpope/vim-surround' " surround vim objects with a pair of identical chars
Plug 'tpope/vim-unimpaired'              " insert/move lines up/down
Plug 'tpope/vim-dispatch'              " asynchronous external command execution
Plug 'tpope/vim-eunuch' " help for UNIX e.g. :Remove :SudoWrite :Move :Rename etc.
Plug 'vim-scripts/loremipsum', { 'on': 'Loremipsum'} " to insert lorem ipsum blocks
Plug 'vim-scripts/zoomwintab.vim', {'on' : 'ZoomWinTabToggle'} " Window zoom/resize

" Bling
Plug 'altercation/vim-colors-solarized'            " solarized (F5 toggle background)
Plug 'bling/vim-airline' " good-looking status line
Plug 'flazz/vim-colorschemes'
Plug 'joedicastro/vim-molokai256'        " additional colourscheme


" Text-objects
Plug 'kana/vim-textobj-entire' " ae, ie
Plug 'kana/vim-textobj-indent' " ai, ii, aI, iI
Plug 'kana/vim-textobj-lastpat' " a/, i/, a?, i?
Plug 'kana/vim-textobj-line' " al, il
Plug 'kana/vim-textobj-underscore' " a_, i_
Plug 'kana/vim-textobj-user'

" Required:
call plug#end()

" Required:
filetype plugin indent on      " Indent and plugins by filetype


" END PLUGINS (administrated by vim-plug) }}}

" <Leader> & <LocalLeader> mapping {{{

let mapleader=','
let maplocalleader= ' '

" }}}

" Local vimrc configuration {{{

let s:local_vimrc = expand('~/.local.vimrc')
if filereadable(s:local_vimrc)
    exec ':so ' . s:local_vimrc
endif

" }}}

" PLUGINS CONFIGURATION {{{

" Airline {{{

set noshowmode " Don't show the default mode indicator

" let g:airline_theme='solarized'
let g:airline#extensions#branc#enable=1
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_min_count = 1

" }}}

" Font {{{

set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 11
" Italics
set t_ZH=[3m
set t_ZR=[23m

" }}}

" Neomru {{{

let g:neomru#file_mru_path = $NACVIM.'/tmp/neomru/file'
let g:neomru#directory_mru_path = $NACVIM.'/tmp/neomru/directory'

" }}}

" Unite {{{

" files
nnoremap <silent><Leader>o :Unite -silent -start-insert file<CR>
nnoremap <silent><Leader>O :Unite -silent -start-insert file_rec/async<CR>
nnoremap <silent><Leader>m :Unite -silent file_mru<CR>
" buffers
nnoremap <silent><Leader>b :Unite -silent buffer<CR>
" tabs
nnoremap <silent><Leader>B :Unite -silent tab<CR>
" search in buffer
nnoremap <silent><Leader>f :Unite -silent -no-split -start-insert -auto-preview
            \ line<CR>
" search in all open buffers
nnoremap <silent><Leader>F :Unite -silent -no-split -start-insert -auto-preview
            \ line:buffers<CR>
nnoremap <silent>[menu]8 :UniteWithCursorWord -silent -no-split -auto-preview
            \ line<CR>
" yankring
nnoremap <silent><Leader>i :Unite -silent history/yank<CR>
" help
nnoremap <silent> g<C-h> :UniteWithCursorWord -silent help<CR>
" tasks
nnoremap <silent><Leader>; :Unite -silent -toggle
            \ grep:%::FIXME\|TODO\|NOTE\|XXX\|COMBAK\|@todo<CR>
" outlines (also ctags)
nnoremap <silent><Leader>t :Unite -silent -vertical -winwidth=40
            \ -direction=topleft -toggle outline<CR>

" }}}

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_mru,file_rec,file_rec/async,grep,locate',
      \ 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/'], '\|'))
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 0
let g:unite_enable_short_source_mes = 0
let g:unite_force_overwrite_statusline = 0
let g:unite_prompt = '>>> '
let g:unite_marked_icon = '✓'
let g:unite_candidate_icon = '∘'
let g:unite_winheight = 15
let g:unite_update_time = 200
let g:unite_split_rule = 'botright'
let g:unite_data_directory = $NACVIM.'/tmp/unite'
let g:unite_source_buffer_time_format = '(%d-%m-%Y %H:%M:%S) '
let g:unite_source_file_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
let g:unite_source_directory_mru_time_format = '(%d-%m-%Y %H:%M:%S) '

" }}}

" END PLUGINS SETUP }}}

" Unite menus {{{

let g:unite_source_menu_menus = {}

" menu prefix key (for all Unite menus) {{{

nnoremap [menu] <Nop>
nmap ` [menu]

" }}}

" Main Unite Menu {{{
let g:unite_source_menu_menus.vim = {
    \ 'description' : '            vim
        \                                                   ⌘ \v',
    \}
let g:unite_source_menu_menus.vim.command_candidates = [
    \['▷ choose colorscheme',
        \'Unite colorscheme -auto-preview'],
    \['▷ mappings',
        \'Unite mapping -start-insert'],
    \['▷ edit configuration file (vimrc)',
        \'edit $MYVIMRC'],
    \['▷ choose filetype',
        \'Unite -start-insert filetype'],
    \['▷ vim help',
        \'Unite -start-insert help'],
    \['▷ vim commands',
        \'Unite -start-insert command'],
    \['▷ vim functions',
        \'Unite -start-insert function'],
    \['▷ vim runtimepath',
        \'Unite -start-insert runtimepath'],
    \['▷ vim command output',
        \'Unite output'],
    \['▷ unite sources',
        \'Unite source'],
    \['▷ kill process',
        \'Unite -default-action=sigkill -start-insert process'],
    \['▷ launch executable (dmenu like)',
        \'Unite -start-insert launcher'],
    \]
nnoremap <silent>[menu]v :Unite menu:vim -silent -start-insert<CR>

" END Unite Menu }}}

" topic-specific vimrc {{{

for package in g:nacvim_packages
    let package_path = $NACVIM."/packages/".package.".vimrc"
    if filereadable(package_path)
        exec ':so ' package_path
    endif
endfor

" end topic-specific vimrc }}}

" Additional Configuration {{{

let s:after_vimrc = expand('~/.after.vimrc')
if filereadable(s:after_vimrc)
    exec ':so ' . s:after_vimrc
endif

nnoremap <leader>r :set operatorfunc=<SID>GoogleScholarBibTex<cr>g@
vnoremap <leader>r :<c-u>call <SID>GoogleScholarBibTex(visualmode())<cr>

function! s:GoogleScholarBibTex(type)
  let saved_unnamed_register = @@

  if a:type ==# 'v'
      normal! `<v`>y
  elseif a:type ==# 'char'
      normal! `[v`]y
  else
      return
  endif

  " execute "!python ~\/copyediting\/materials\/gscholar\/gscholar\/gscholar.py -a " . shellescape(@@)
  execute "Dispatch ~/copyediting/materials/gscholar/gscholar/gscholar.py " . shellescape(@@) | copen
  " execute "Dispatch ~/copyediting/materials/gscholar/gscholar/gscholar.py -a " . shellescape(@@) | copen
  " execute "Dispatch python ./test.py"
  " copen

  let @@ = saved_unnamed_register
endfunction

" }}}
