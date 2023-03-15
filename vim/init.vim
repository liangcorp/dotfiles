" Make sure to source this file

source $HOME/.config/vim/config/plugins.vim
source $HOME/.config/vim/config/nerdtree.vim
source $HOME/.config/vim/config/coc.vim
source $HOME/.config/vim/config/mappings.vim
source $HOME/.config/vim/config/debugger.vim

syntax on
" filetype plugin on
filetype plugin indent on

set nocompatible
set number
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set path+=**
set wildmenu
set ruler
set wildmenu
set mouse=a
set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10
set autowrite

let g:indentLine_enabled = 1
let g:indentLine_concealcursor = ''
let g:indentLine_char = '┆'
let g:indentLine_faster = 1

colorscheme onedark

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * call TrimWhitespace()

