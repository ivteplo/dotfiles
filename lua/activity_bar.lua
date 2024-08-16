-- Bottom file information line --
require("lualine").setup {
	options = {
		component_separators = "",
		section_separators = ""
	},
	sections = {
		lualine_a = {"mode"},
		lualine_b = {"branch", "diff", "diagnostics"},
		lualine_c = {"filename", "filesize"},
		lualine_x = {"encoding", "fileformat", "filetype"},
		lualine_y = {},
		lualine_z = {"location", "selectioncount"}
	}
}
