set encoding=utf-8
set filetype=unix

set noswapfile

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
set numberwidth=7

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

set scrolloff=7

"""""""
" GUI "
"""""""

if has("gui_running")
    set guioptions=
    set guifont=JetBrains\ Mono\ NL:h12
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
    " Sidebar with files in the current folder
    Plug 'scrooloose/nerdtree'

    " Shows a bottom bar with useful information
    Plug 'vim-airline/vim-airline'

    " Emmet support for vim
    Plug 'mattn/emmet-vim'

    " Autoclose parentheses
    Plug 'Townk/vim-autoclose'

    " Fuzzy file finder is a tool to quickly find a file in your project
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 

    " EditorConfig is a plugin to enforce the same settings
    " across different code editors
    Plug 'editorconfig/editorconfig-vim'

    " Better support for JavaScript syntax highlighting
    Plug 'yuezk/vim-js'

    " Color schemes
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'ghifarit53/tokyonight-vim'
    Plug 'arzg/vim-colors-xcode'
    Plug 'rakr/vim-one'
    Plug 'ntk148v/vim-horizon'
call plug#end()


""""""""""
" THEMES "
""""""""""

" Tokyo Night
function ThemeTokyoNight()
    let g:tokyonight_style = 'storm' " available: night, storm
    let g:tokyonight_enable_italic = 1
    colorscheme tokyonight
endfunction
" call ThemeTokyoNight()

" One Dark
function ThemeOneDark()
    set background=dark
    let g:airline_theme='one'
    colorscheme one
endfunction
" call ThemeOneDark()

" Xcode theme
function ThemeXcode()
    " There are multiple variants of this theme
    colorscheme xcodedark
    " Other variants (hc = high contrast):
    "colorscheme xcodedarkhc
    "colorscheme xcodelight
    "colorscheme xcodelighthc
    "colorscheme xcodewwdc
endfunction
" call ThemeXcode()

" Dracula theme
function ThemeDracula()
    colorscheme dracula
endfunction
" call ThemeDracula()

" Horizon theme
function ThemeHorizon()
    colorscheme horizon
endfunction
call ThemeHorizon()

" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 

" Disable typing sound in vim
let g:vim_typing_sound = 0

" Toggle sidebar when hitting Ctrl+b
nnoremap <C-b> :NERDTreeToggle<CR>

" Make Fuzzy Finder open when hitting Ctrl+p
nnoremap <C-p> :FZF<CR>


"""""""""""""""""""""""""""
" LANGUAGE CUSTOMIZATIONS "
"""""""""""""""""""""""""""

" Make *.asm files use nasm syntax by default
autocmd BufEnter *.asm setlocal syntax=nasm

