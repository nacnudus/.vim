" VIM Setup {{{

" turn on the spell checking and set the English language
nmap <Leader>sg :setlocal spell spelllang=en_gb<CR>
nmap <Leader>sz :setlocal spell spelllang=en_nz<CR>
nmap <Leader>su :setlocal spell spelllang=en_us<CR>
" add science dictionaries
nmap <Leader>Sg :setlocal spell spelllang=en_gb,scienceuk<CR>
nmap <Leader>Sz :setlocal spell spelllang=en_nz,scienceuk<CR>
nmap <Leader>Su :setlocal spell spelllang=en_us,scienceus<CR>
" use a dictionary in the local folder (which will be created if it doesn't exist)
nmap <Leader>sl :setlocal spell spellfile=./local.utf-8.add<CR>
nmap <Leader>sL :mkspell! ./local.utf-8.add<CR>
" turn off the spell checking    
nmap <Leader>so :setlocal nospell <CR>
" jump to the next bad spell word
nmap <Leader>sn ]s
" suggest words
nmap <Leader>sp z=
" jump to the next bad spell word and suggests a correct one
nmap <Leader>sc ]sz=
" add word to the dictionary
nmap <Leader>sa zg

" Spelling highlighting
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=undercurl cterm=undercurl
highlight clear SpellCap
highlight SpellCap term=standout ctermfg=1 term=undercurl cterm=undercurl
highlight clear SpellRare
highlight SpellRare term=standout ctermfg=1 term=undercurl cterm=undercurl
highlight clear SpellLocal
highlight SpellLocal term=standout ctermfg=1 term=undercurl cterm=undercurl


" LanguageTool grammar checking
let g:languagetool_jar='/home/nacnudus/languagetool/languagetool-commandline.jar'
" Disable spellchecking in LanguageTool
let g:languagetool_disable_rules='WHITESPACE_RULE,EN_QUOTESMORFOLOGIK_RULE_EN_US,MORFOLOGIK_RULE_EN_US'

" END VIM SETUP }}}

" Unite Menu {{{
let g:unite_source_menu_menus.spelling = {
    \ 'description' : '       spell checking
        \                                        ⌘ [space]s',
    \}
let g:unite_source_menu_menus.spelling.command_candidates = [
    \['▷ spell checking in English                                  ⌘ ,sgb',
        \'setlocal spell spelllang=en_gb'],
    \['▷ spell checking in English                                  ⌘ ,snz',
        \'setlocal spell spelllang=en_nz'],
    \['▷ spell checking in English                                  ⌘ ,sus',
        \'setlocal spell spelllang=en_us'],
    \['▷ turn off spell checking                                    ⌘ ,so',
        \'setlocal nospell'],
    \['▷ jumps to next bad spell word and show suggestions          ⌘ ,sc',
        \'normal ,sc'],
    \['▷ jumps to next bad spell word                               ⌘ ,sn',
        \'normal ,sn'],
    \['▷ suggestions                                                ⌘ ,sp',
        \'normal ,sp'],
    \['▷ add word to dictionary                                     ⌘ ,sa',
        \'normal ,sa'],
    \]
nnoremap <silent>[menu]s :Unite -silent menu:spelling<CR>

" END Unite Menu }}}
