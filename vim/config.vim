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
set tabstop=2
set shiftwidth=2
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

"""""""""""""""""""""""""""""""""""""""""
" LOAD OTHER FILES IN THE CONFIG FOLDER "
"""""""""""""""""""""""""""""""""""""""""

let vim_config_folder = resolve(expand('<sfile>:p:h'))

function! ImportConfigFile(file_name)
    let file_path = g:vim_config_folder . "/" . a:file_name
    if filereadable(file_path)
        exec "source " . file_path
    endif
endfunction

"""""""""""
" PLUGINS "
"""""""""""
call ImportConfigFile("plugins.vim")

""""""""""
" THEMES "
""""""""""

" Tokyo Night
function ThemeTokyoNight()
    let g:tokyonight_style = 'storm' " available: night, storm
    let g:tokyonight_enable_italic = 1
    colorscheme tokyonight
endfunction

" One Dark
function ThemeOneDark()
    set background=dark
    let g:airline_theme='one'
    colorscheme one
endfunction

" One Light
function ThemeOneLight()
    set background=light
    let g:airline_theme='one'
    colorscheme one
endfunction

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

" Dracula theme
function ThemeDracula()
    colorscheme dracula
endfunction

" Horizon theme
function ThemeHorizon()
    colorscheme horizon
endfunction

call ImportConfigFile("theme.vim")

" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 

" Disable typing sound in vim
let g:vim_typing_sound = 0


"""""""""""""""
" KEYBINDINGS "
"""""""""""""""
call ImportConfigFile("keybindings.vim")


"""""""""""""""""""""""""""
" LANGUAGE CUSTOMIZATIONS "
"""""""""""""""""""""""""""

" Make *.asm files use nasm syntax by default
autocmd BufEnter *.asm setlocal syntax=nasm


""""""""""
" NEOVIM "
""""""""""

let neovim_config_folder = resolve(g:vim_config_folder . '/../nvim/lua')
let neovim_config_folder = substitute(neovim_config_folder, "\\", "/", "g")

if has('nvim')
    let lua_package_path = neovim_config_folder . "/?.lua"

    " Make the init.lua script see other files in the nvim/lua folder
    exec "lua package.path = ';" . neovim_config_folder . "/?.lua;' .. package.path"

    " Import the init.lua script
    exec "lua require('init')"
endif
