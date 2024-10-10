-- Show line numbers
vim.opt.number = true

-- Do not wrap lines by default
vim.opt.wrap = false

-- Allow using mouse to interact with vim
vim.opt.mouse = "a"

-- Ignore case of search query, unless you write some capital letters
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Do not highlight search results
vim.opt.hlsearch = false

-- Width of the tab character
vim.opt.tabstop = 4

-- Amout of lines that we move by when indenting/dedenting using visual mode or `>>` and `<<` keybindings
vim.opt.shiftwidth = vim.o.tabstop

-- Do not transform Tab character to spaces
vim.opt.expandtab = false

-- Some keybindings use `<leader>` as a beginning character. By default it is `\`, but comma is more easy to reach
vim.g.mapleader = ","
