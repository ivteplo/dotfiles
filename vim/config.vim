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

    if has('nvim')
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    else
        " Fuzzy file finder is a tool to quickly find a file in your project
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
    endif

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
" call ThemeHorizon()

let vim_config_folder = resolve(expand('<sfile>:p:h'))
let theme_file = vim_config_folder . "/theme.vim"
if filereadable(theme_file)
    exec "source " . theme_file
else
    call ThemeOneDark()
endif

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
if has('nvim')
    nnoremap <C-p> :Telescope find_files<CR>
else
    nnoremap <C-p> :FZF<CR>
endif


"""""""""""""""""""""""""""
" LANGUAGE CUSTOMIZATIONS "
"""""""""""""""""""""""""""

" Make *.asm files use nasm syntax by default
autocmd BufEnter *.asm setlocal syntax=nasm


""""""""""
" NEOVIM "
""""""""""

let neovim_config_folder = substitute(resolve(vim_config_folder . '/../nvim/lua'), "\\", "/", "g")

if has('nvim')
    let lua_package_path = neovim_config_folder . "/?.lua"
    exec "lua package.path = ';" . neovim_config_folder . "/?.lua;' .. package.path"
    exec "lua require('init')"
endif
