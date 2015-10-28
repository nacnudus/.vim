
" autocmd FileType tex let b:atp_BibCompiler = "biber"
" autocmd FileType tex let b:atp_TexCompiler = "pdflatex"

" Make forward-search work
" autocmd FileType tex nnoremap <buffer> <LocalLeader>f :call atplib#compiler#SyncTex("!", 0, b:atp_MainFile, b:atp_XpdfServer)<CR>

let g:vimtex_quickfix_ignore_all_warnings = 1

" Quickly comment-out the rest of a line
nnoremap <buffer> <LocalLeader>% i %<Esc>

" Don't automatically reflow, rather use soft wrapping
set fo-=t
set fo-=a
set linebreak

" Expand abbreviations to queries
nnoremap <leader>Q :call Query()<cr>
function! Query()
  let saved_unnamed_register = @@
  let l:querydict = {}
  let l:querydict["c"] = " conference"
  let l:querydict["C"] = " country"
  let l:querydict["e"] = " editor(s)"
  let l:querydict["p"] = " publisher"
  let l:querydict["d"] = " date"
  let l:querydict["f"] = " full"
  let l:querydict["l"] = " location"
  let l:querydict["P"] = " page numbers"
  let l:querydict[","] = ","
  let l:querydict["a"] = " and"
  let l:querydict["o"] = " of"
  let l:querydict["t"] = " the"
  let l:querydict["T"] = " their"
  let l:querystring = expand("<cWORD>")
  let l:returnstring = '\query{Please provide the'
  for l:item in split(l:querystring, '\zs')
    let l:returnstring = l:returnstring . l:querydict[l:item]
  endfor
  let l:returnstring = l:returnstring . ".}"
  " call setline(".", l:returnstring)
  let @@ = l:returnstring
  " :exe 'normal! "viWp' . l:returnstring
  :exe 'normal! viWp'
  let @@ = saved_unnamed_register
endfunction

" Prepare bbl or other formatted references for bbl2bib.py
vnoremap <leader>C y:new<cr>P:%s/.\zs\n\ze./ /<cr>:g/^$/d<cr>:%s/\\bibitem\ \?{[[:alnum:]]\+}\ \?//ge<cr>:%s/\\[[:alpha]]\+{\(.\+\)}/\1/ge<cr>:%s/\\[[:alpha:]]\+\ \?//ge<cr>:%s/[{}]//ge<cr>
