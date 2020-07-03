set wrap
set magic
set mouse=a
set number
set termguicolors

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Using VimPlug as the plugin manager
call plug#begin('~/.vim/plugged')

    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'kaicataldo/material.vim'

call plug#end()

let g:airline#extensions#tabline#enabled = 1

nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
nnoremap <C-q> :bufdo bwipeout<CR>:q<CR>
nnoremap <C-b> :NERDTreeToggle<CR>

try
    colorscheme material
catch
endtry

