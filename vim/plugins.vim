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
    " Fuzzy file finder and other cool stuff
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

    " Some defaults for LSP configuration
    Plug 'neovim/nvim-lspconfig'

    " Autocompletions
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/nvim-cmp'
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
  Plug 'ghifarit53/tokyonight-vim'
  Plug 'ntk148v/vim-horizon'
  Plug 'rakr/vim-one'
call plug#end()
