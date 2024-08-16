vim9script

# Disable Vi compatibility mode
set nocompatible

# Enable using mouse
set mouse=a

# Use 24-bit RGB colors if possible
if has('termguicolors')
	set termguicolors
endif

# Use UTF-8 by default
set encoding=UTF-8

# Set default tab stop
set tabstop=4

# Smartly indent and dedent (by 4 spaces)
set autoindent
set smarttab
set shiftwidth=4

# Use tabs instead of spaces
set noexpandtab

# Use a special characters to display whitespace 
# when the `set list` is specified
set listchars=tab:→\ ,lead:•
set list

# Enable regular-expression-based search
set magic

# If upper-case letters are written in search, it will become case-sensitive
set smartcase

# Highlight search results
set hlsearch

# Highlight search results as you type the search query
set incsearch

# Allow using backspace even at the line start
set backspace=indent,eol,start

# Show line numbers
set number
set numberwidth=7

# Enable syntax highlighting
syntax on

# By default disable line wrapping
set nowrap

# Emmet settings
g:user_emmet_leader_key = '<C-Y>'

# Automatically install vim-plug if it isn't installed
# (taken from https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation)
#data_dir = has('nvim') ? stdpath('data').'/site' :'~/.vim'
var data_dir = '~/.vim'
var plug_folder = data_dir .. '/plugged'
if empty(glob(data_dir .. '/autoload/plug.vim'))
	silent execute '!curl -fLo ' .. data_dir .. '/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


# Run PlugInstall if there are missing plugins
# (taken from https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation-of-missing-plugins)
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
	\| PlugInstall --sync | source $MYVIMRC
\| endif


# Define plugins to install
plug#begin(plug_folder)
	# Make '.' work for repeating plugin commands
	Plug 'tpope/vim-repeat'

	# File explorer in the sidebar
	Plug 'scrooloose/nerdtree'

	# Emmet for Vim. Default keybinding is `<C-Y>,`
	Plug 'mattn/emmet-vim'

	# Some color schemes
	Plug 'drewtempelmeyer/palenight.vim'
	Plug 'joshdick/onedark.vim'
	Plug 'ghifarit53/tokyonight-vim'
plug#end()

def ThemePalenight()
	set background=dark
	g:airline_theme = 'palenight'
	g:palenight_terminal_italics=0
	colorscheme palenight
enddef

def ThemeOneDark()
	set background=dark
	g:airline_theme = 'onedark'

	if has('termguicolors')
		g:onedark_termcolors = 1
	else
		g:onedark_termcolors = 0
	endif

	g:onedark_terminal_italics = 0
	colorscheme onedark
enddef

def ThemeTokyoNight()
	set background=dark
	g:airline_theme = 'tokyonight'
	g:tokyonight_style = 'night' " available: night, storm
	g:tokyonight_enable_italic = 0
	g:tokyonight_transparent_background = 0
	g:tokyonight_disable_italic_comment = 0
	colorscheme tokyonight
enddef

ThemeOneDark()

nnoremap <C-b> :NERDTreeToggle<CR>

