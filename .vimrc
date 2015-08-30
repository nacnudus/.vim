" Set nocompatible here so that the list will work
set nocompatible

" This is the oh my vim directory
let $NACVIM="/home/nacnudus/.vim"

" Select the packages you need
let g:nacvim_packages=[
            \'basic',
            \'code',
            \'spelling',
            \'text',
            \'files',
            \'grep',
            \'git',
            \'navigation',
            \'registers',
            \'markdown',
            \'copyediting',
            \'python'
            \]


exec ':so ' $NACVIM."/vimrc"
