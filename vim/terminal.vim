
if !has("nvim")
  set termwinsize=10x0
else
  autocmd TermOpen * setlocal nonumber norelativenumber
endif
