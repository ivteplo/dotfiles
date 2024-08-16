require("barbar").setup {
	animation = true,

	-- Automatically hide the tabline when there are this many buffers left.
	-- Set to any value >=0 to enable.
	auto_hide = false,

	-- Enable/disable current/total tabpages indicator (top right corner)
	tabpages = true,

	-- Enables/disable clickable tabs
	--  - left-click: go to buffer
	--  - middle-click: delete buffer
	clickable = true,

	-- A buffer to this direction will be focused (if it exists) when closing the current buffer.
	-- Valid options are 'left' (the default), 'previous', and 'right'
	focus_on_close = "previous",

	-- If true, new buffers will be inserted at the start/end of the list.
	-- Default is to insert after current buffer.
	insert_at_end = true,
	insert_at_start = false,
}


-- Move to previous/next
vim.keymap.set('n', '<C-p>', '<Cmd>BufferPrevious<CR>')
vim.keymap.set('n', '<C-n>', '<Cmd>BufferNext<CR>')

-- Re-order to previous/next
vim.keymap.set('n', '<leader><C-p>', '<Cmd>BufferMovePrevious<CR>')
vim.keymap.set('n', '<leader><C-n>', '<Cmd>BufferMoveNext<CR>')

-- Close buffer
vim.keymap.set('n', '<leader>x', '<Cmd>BufferClose<CR>')

-- Wipeout buffer
--     :BufferWipeout
--
-- Close commands
--     :BufferCloseAllButCurrent
--     :BufferCloseAllButPinned
--     :BufferCloseAllButCurrentOrPinned
--     :BufferCloseBuffersLeft
--     :BufferCloseBuffersRight

-- Sort automatically by...
--     :BufferOrderByBufferNumber
--     :BufferOrderByDirectory
--     :BufferOrderByLanguage
--     :BufferOrderByWindowNumber
--
-- Other:
--     :BarbarEnable - enables barbar (enabled by default)
--     :BarbarDisable - very bad command, should never be used

