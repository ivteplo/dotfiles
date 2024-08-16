vim.opt.shell = "pwsh.exe"
vim.opt.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
vim.opt.shellquote = ""
vim.opt.shellxquote = ""

-- Toggle terminal --
require("toggleterm").setup {
	size = 10,
	open_mapping = "<leader>term",

	-- hide the number column in toggleterm buffers
	hide_numbers = true,

	-- when neovim changes it current directory the terminal will change it's own when next it's opened
	autochdir = true,

	start_in_insert = true,
	-- whether or not the open mapping applies in insert mode
	insert_mappings = true,

	-- whether or not the open mapping applies in the opened terminals
	terminal_mappings = true,
	persist_size = true,
	-- if set to true (default) the previous terminal mode will be remembered
	persist_mode = true,
	direction = "horizontal",

	-- close the terminal window when the process exits
	close_on_exit = true,
	 -- Change the default shell. Can be a string or a function returning a string
	shell = vim.o.shell,
	-- automatically scroll to the bottom on terminal output
	auto_scroll = true,
}
