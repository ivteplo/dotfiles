vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.asm",
	command = "set syntax=nasm",
	desc = "Use NASM syntax as the default when opening *.asm files"
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.axaml",
	command = "set syntax=xml",
	desc = "Use XML syntax for Avalonia XAML Files"
})
