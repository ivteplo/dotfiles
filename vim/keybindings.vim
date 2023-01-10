" Clear the search highlighting when hitting Enter
nnoremap <cr> :nohlsearch<cr>

" Clear the search pattern when hitting Ctrl+a
nnoremap <C-a> :let @/ = ""<CR>

" Toggle sidebar when hitting Ctrl+b
nnoremap <C-b> :NERDTreeToggle<CR>

" Make Fuzzy Finder open when hitting Ctrl+p
if has('nvim')
    nnoremap <C-p> :Telescope find_files<CR>
else
    nnoremap <C-p> :FZF<CR>
endif

