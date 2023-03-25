"""""""""""""""""""""
" SOME BASIC CONFIG "
"""""""""""""""""""""

set encoding=utf-8
set filetype=unix

set noswapfile

" Disable Vi compatibility
set nocompatible

" Without the 'magic', characters '*', '.', and '~' are considered
" as characters in a regular expression. With the 'magic', they are 
" treated the same way as regular expressions in most programming languages
set magic

" Allow mouse being used
set mouse=a

" Enable wider color range
set termguicolors

" Show line numbers
set number

" Just for some padding to the left of the line numbers
set numberwidth=7

" Display incomplete commands
set showcmd

" Enable syntax highlighting
syntax on

" Somehow improve backspace behavior
set backspace=indent,eol,start

" Enable loading the plugin files for specific file types
filetype plugin on

" Setting default tab width and use spaces for tabs
set tabstop=2
set shiftwidth=2
set expandtab 
set smarttab

" Minimal number of lines to keep above and below the cursor
set scrolloff=7

" Disable line wrapping on all files, except markdown
set nowrap
autocmd FileType markdown setlocal nowrap

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
function ThemeTokyoNight(style = 'storm')
  let g:tokyonight_style = a:style " available: night, storm
  let g:tokyonight_enable_italic = 1
  set background=dark
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

" Horizon theme
function ThemeHorizon()
  set background=dark
  colorscheme horizon
endfunction

call ImportConfigFile("theme.vim")

" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 


"""""""""""""""
" KEYBINDINGS "
"""""""""""""""
call ImportConfigFile("keybindings.vim")


"""""""""""""""""""""""""""
" LANGUAGE CUSTOMIZATIONS "
"""""""""""""""""""""""""""

" Make *.asm files use NASM syntax by default
autocmd BufEnter *.asm setlocal syntax=nasm

""""""""""
" NEOVIM "
""""""""""

let neovim_config_folder = g:vim_config_folder . '/nvim'
let neovim_config_folder = substitute(neovim_config_folder, "\\", "/", "g")

if has('nvim')
  let lua_package_path = neovim_config_folder . "/?.lua"

  " Make the init.lua script see other files in the nvim/lua folder
  exec "lua package.path = ';" . neovim_config_folder . "/?.lua;' .. package.path"

  " Import the init.lua script
  exec "lua require('init')"
endif
