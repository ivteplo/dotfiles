return {
	-- Auto-detect indentation
	{ 
		"nmac427/guess-indent.nvim" ,
		opts = {}
	},

	-- Auto-close braces, brackets, parentheses, quotes, etc.
	{
		"m4xshen/autoclose.nvim",
		opts = {}
	},

	-- Quickly comment
	{
		"numToStr/Comment.nvim",
		opts = {
			-- Works only in line mode
			toggler = {
				line = "<C-/>",
				block = "<C-?>",
			},
			-- Mappings for the normal and visual modes
			opleader = {
				line = "<C-/>",
				block = "<C-?>",
			}
		}
	},
}
