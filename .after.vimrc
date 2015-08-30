" interactive mode > normal mode (can't put comments inline with this one or it jumps randomly after exiting normal mode).
inoremap jk <ESC>

" unmap insert-mode LocalLeader mappings in rmd files because they're annoying
" when using the space bar.
" autocmd FileType rmd iunmap <buffer> <LocalLeader>l
" autocmd FileType rmd iunmap <buffer> <LocalLeader>kh
autocmd FileType r,rmd,rnoweb source ~/.vim/packages/rmd.vimrc

" Piggy-back on vim-argumentative to fix conference proceedings like
" "Transactions on Knowledge and Data Engineering, IEEE Transactions on"
autocmd FileType tex,bib nmap <leader>s, >,:'<,'>s/,//<CR>:noh<CR>
autocmd FileType tex,bib nmap <leader>S, <,:'<,'>s/,//<CR>:noh<CR>
