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
