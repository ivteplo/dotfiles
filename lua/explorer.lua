local refreshed_icons = false

-- Sidebar with file explorer
vim.keymap.set("n", "<leader>fs", function ()
	vim.cmd("NERDTreeToggle")

	if not refreshed_icons then
		vim.cmd("call webdevicons#refresh()")
		refreshed_icons = true
	end
end)

-- Open NerdTree with Vim
--vim.cmd("autocmd VimEnter * NERDTreeToggle")

vim.cmd [[
	autocmd BufNewFile,BufRead * if &ft ==# "nerdtree" | set conceallevel=3 | endif
	if exists('g:loaded_webdevicons')
		call webdevicons#refresh()
	endif
]]

