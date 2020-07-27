set magic
set mouse=a
set termguicolors

filetype plugin on

" Setting default tab width and use spaces for tabs
set tabstop=4
set shiftwidth=4 
set softtabstop=0 
set expandtab 
set smarttab

call plug#begin('~/.vim/plugged')

    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'kaicataldo/material.vim'

call plug#end()

let g:airline#extensions#tabline#enabled = 1

" Keyboard shortcuts
nnoremap <C-q> :bufdo bwipeout<CR>:q<CR>
nnoremap <C-b> :NERDTreeToggle<CR>

" Make *.asm files use nasm syntax by default
autocmd BufEnter *.asm setlocal syntax=nasm

" Make html, js and css files use tab width 2
autocmd BufEnter *.html,*.css,*.pug,*.sass,*.scss,*.js,*.jsx,*.ts,*.tsx 
    \ setlocal tabstop=2 |
    \ setlocal shiftwidth=2

" Apply colorscheme
try
    colorscheme material
catch
endtry

