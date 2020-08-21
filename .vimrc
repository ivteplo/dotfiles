
"""""""""""""""""""""
" SOME BASIC CONFIG "
"""""""""""""""""""""

" Disable Vi-compatible mode
set nocompatible

set magic
set mouse=a
set termguicolors

" Show line numbers
set number
set numberwidth=5

" Display incomplete commands
set showcmd

" Enable highlighting for syntax
syntax on

set backspace=indent,eol,start

filetype plugin on

" Setting default tab width and use spaces for tabs
set tabstop=4
set shiftwidth=4 
set softtabstop=0 
set expandtab 
set smarttab

"""""""
" GUI "
"""""""

if has("gui_running")
    set guioptions=
    set guifont=Cascadia\ Code\ PL:h12
endif

""""""""""
" SEARCH "
""""""""""

" Make search results be highlighted
set hlsearch

" Make searches case-sensitive only if there are upper-case letters
set ignorecase smartcase

" Clear the search highlighting when hitting Enter
nnoremap <cr> :nohlsearch<cr>

" Clear the search pattern when hitting Ctrl+a
nnoremap <C-a> :let @/ = ""<CR>


"""""""""""
" PLUGINS "
"""""""""""

call plug#begin('~/.vim/plugged')

    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'mattn/emmet-vim'
    Plug 'Townk/vim-autoclose'
    Plug 'arzg/vim-colors-xcode'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 

call plug#end()


"""""""""""""""""
" CUSTOMIZATION "
"""""""""""""""""

" Apply colorscheme
colorscheme xcodedark

" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 

" Disable typing sound in vim
let g:vim_typing_sound = 0

" Make NERDTree open when hitting Ctrl+b
nnoremap <C-b> :NERDTreeToggle<CR>

" Make Fuzzy Finder open when hitting Ctrl+p
nnoremap <C-p> :FZF<CR>


"""""""""""""""""""""""""""
" LANGUAGE CUSTOMIZATIONS "
"""""""""""""""""""""""""""

" Make *.asm files use nasm syntax by default
autocmd BufEnter *.asm setlocal syntax=nasm


" Make html, js and css files use tab width 2
autocmd BufEnter *.html,*.css,*.pug,*.sass,*.scss,*.js,*.jsx,*.ts,*.tsx 
    \ setlocal tabstop=2 |
    \ setlocal shiftwidth=2


"""""""""""""
" FUNCTIONS "
"""""""""""""

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

